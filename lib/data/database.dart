import 'package:hive/hive.dart';

import '../models/image.dart';

class Database {
  static Box<Image> get imagesBox => Hive.box('gallery');

  static Future<void> saveImage(Image image) async {
    await imagesBox.put(image.id, image);
  }

  static Future<List<Image>> getImages() async {
    return imagesBox.values.toList();
  }
}
