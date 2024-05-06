import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 1)
class Image extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? pageUrl;
  @HiveField(2)
  String? type;
  @HiveField(3)
  String? tags;
  @HiveField(4)
  String? previewUrl;
  @HiveField(5)
  int? previewWidth;
  @HiveField(6)
  int? previewHeight;
  @HiveField(7)
  String? webformatUrl;
  @HiveField(8)
  int? webformatWidth;
  @HiveField(9)
  int? webformatHeight;
  @HiveField(10)
  String? largeImageUrl;
  @HiveField(11)
  int? imageWidth;
  @HiveField(12)
  int? imageHeight;
  @HiveField(13)
  int? imageSize;
  @HiveField(14)
  int? views;
  @HiveField(15)
  int? downloads;
  @HiveField(16)
  int? collections;
  @HiveField(17)
  int? likes;
  @HiveField(18)
  int? comments;
  @HiveField(19)
  int? userId;
  @HiveField(20)
  String? user;
  @HiveField(21)
  String? userImageUrl;

  Image({this.id, this.pageUrl, this.type, this.tags, this.previewUrl, this.previewWidth, this.previewHeight, this.webformatUrl, this.webformatWidth, this.webformatHeight, this.largeImageUrl, this.imageWidth, this.imageHeight, this.imageSize, this.views, this.downloads, this.collections, this.likes, this.comments, this.userId, this.user, this.userImageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    pageUrl = json["pageURL"];
    type = json["type"];
    tags = json["tags"];
    previewUrl = json["previewURL"];
    previewWidth = json["previewWidth"];
    previewHeight = json["previewHeight"];
    webformatUrl = json["webformatURL"];
    webformatWidth = json["webformatWidth"];
    webformatHeight = json["webformatHeight"];
    largeImageUrl = json["largeImageURL"];
    imageWidth = json["imageWidth"];
    imageHeight = json["imageHeight"];
    imageSize = json["imageSize"];
    views = json["views"];
    downloads = json["downloads"];
    collections = json["collections"];
    likes = json["likes"];
    comments = json["comments"];
    userId = json["user_id"];
    user = json["user"];
    userImageUrl = json["userImageURL"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["pageURL"] = pageUrl;
    _data["type"] = type;
    _data["tags"] = tags;
    _data["previewURL"] = previewUrl;
    _data["previewWidth"] = previewWidth;
    _data["previewHeight"] = previewHeight;
    _data["webformatURL"] = webformatUrl;
    _data["webformatWidth"] = webformatWidth;
    _data["webformatHeight"] = webformatHeight;
    _data["largeImageURL"] = largeImageUrl;
    _data["imageWidth"] = imageWidth;
    _data["imageHeight"] = imageHeight;
    _data["imageSize"] = imageSize;
    _data["views"] = views;
    _data["downloads"] = downloads;
    _data["collections"] = collections;
    _data["likes"] = likes;
    _data["comments"] = comments;
    _data["user_id"] = userId;
    _data["user"] = user;
    _data["userImageURL"] = userImageUrl;
    return _data;
  }

  Image copyWith({
    int? id,
    String? pageUrl,
    String? type,
    String? tags,
    String? previewUrl,
    int? previewWidth,
    int? previewHeight,
    String? webformatUrl,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageUrl,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageUrl,
  }) => Image(
    id: id ?? this.id,
    pageUrl: pageUrl ?? this.pageUrl,
    type: type ?? this.type,
    tags: tags ?? this.tags,
    previewUrl: previewUrl ?? this.previewUrl,
    previewWidth: previewWidth ?? this.previewWidth,
    previewHeight: previewHeight ?? this.previewHeight,
    webformatUrl: webformatUrl ?? this.webformatUrl,
    webformatWidth: webformatWidth ?? this.webformatWidth,
    webformatHeight: webformatHeight ?? this.webformatHeight,
    largeImageUrl: largeImageUrl ?? this.largeImageUrl,
    imageWidth: imageWidth ?? this.imageWidth,
    imageHeight: imageHeight ?? this.imageHeight,
    imageSize: imageSize ?? this.imageSize,
    views: views ?? this.views,
    downloads: downloads ?? this.downloads,
    collections: collections ?? this.collections,
    likes: likes ?? this.likes,
    comments: comments ?? this.comments,
    userId: userId ?? this.userId,
    user: user ?? this.user,
    userImageUrl: userImageUrl ?? this.userImageUrl,
  );
}