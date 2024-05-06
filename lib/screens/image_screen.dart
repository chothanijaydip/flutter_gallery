import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../models/image.dart' as ImageModel;

class ImageScreen extends StatefulWidget {
  ImageModel.Image image;

  ImageScreen({super.key, required this.image});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.image.id!,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(
                widget.image.webformatUrl.toString(),
                cacheKey: widget.image.webformatUrl.hashCode.toString()),
          ),
        ),
      ),
    );
  }
}
