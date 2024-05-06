import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/image.dart';

class Api {
  static Future<dynamic> fetchImages(String query,
      {currentPage, size}) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=43676987-5a46da93fc3ef4f05c0f407b5&q=$query&page=$currentPage&per_page=$size&image_type=photo&pretty=true'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
