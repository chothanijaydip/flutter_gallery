import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';
import '../data/database.dart';
import '../data/debouncer.dart';
import '../models/image.dart' as image;
import 'image_screen.dart';

class GalleryScreen extends StatefulWidget {

  Function(String) onItemTapped;
  Function(String) onRouteTapped;
  GalleryScreen({super.key, required this.onItemTapped,required this.onRouteTapped});
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  List<image.Image> _images = [];
  int currentPage = 1;
  int size = 50;
  int totelPages = 1;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController
              .position.maxScrollExtent) if (currentPage < totelPages) {
        ++currentPage;
        _search(_searchController.text);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Gallery'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  _search(value);
                });
              },
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
              controller: _scrollController,
              padding: const EdgeInsets.all(5.0),
              children: _images.map((image) {
                return GestureDetector(
                  onTap: () {
                    widget.onItemTapped(image.id.toString());
                    widget.onRouteTapped(image.id.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageScreen(image: image),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                image.previewUrl.toString(),
                                cacheKey: image.id!.toString()),
                            fit: BoxFit.fill)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              Text(
                                " ${image.likes} ".toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              Text(
                                " ${image.views} ".toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _loadImages() async {
    final images = await Database.getImages();
    setState(() {
      _images = images;
    });
  }

  void _search(String query) async {
    try {
      final images =
          await Api.fetchImages(query, currentPage: currentPage, size: size);
      if (images != null) {
        setState(() {
          _images.addAll((images['hits'] as List)
              .map((e) => image.Image.fromJson(e))
              .toList());
          if (images['totalHits'] % size == 0) {
            totelPages = images['totalHits'] ~/ size;
          } else {
            totelPages = (1 + (images['totalHits'] / size).floor()).toInt();
          }
        });
        _images.forEach(Database.saveImage);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
