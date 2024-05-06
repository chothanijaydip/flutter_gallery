// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageAdapter extends TypeAdapter<Image> {
  @override
  final int typeId = 1;

  @override
  Image read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Image(
      id: fields[0] as int?,
      pageUrl: fields[1] as String?,
      type: fields[2] as String?,
      tags: fields[3] as String?,
      previewUrl: fields[4] as String?,
      previewWidth: fields[5] as int?,
      previewHeight: fields[6] as int?,
      webformatUrl: fields[7] as String?,
      webformatWidth: fields[8] as int?,
      webformatHeight: fields[9] as int?,
      largeImageUrl: fields[10] as String?,
      imageWidth: fields[11] as int?,
      imageHeight: fields[12] as int?,
      imageSize: fields[13] as int?,
      views: fields[14] as int?,
      downloads: fields[15] as int?,
      collections: fields[16] as int?,
      likes: fields[17] as int?,
      comments: fields[18] as int?,
      userId: fields[19] as int?,
      user: fields[20] as String?,
      userImageUrl: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Image obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pageUrl)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.previewUrl)
      ..writeByte(5)
      ..write(obj.previewWidth)
      ..writeByte(6)
      ..write(obj.previewHeight)
      ..writeByte(7)
      ..write(obj.webformatUrl)
      ..writeByte(8)
      ..write(obj.webformatWidth)
      ..writeByte(9)
      ..write(obj.webformatHeight)
      ..writeByte(10)
      ..write(obj.largeImageUrl)
      ..writeByte(11)
      ..write(obj.imageWidth)
      ..writeByte(12)
      ..write(obj.imageHeight)
      ..writeByte(13)
      ..write(obj.imageSize)
      ..writeByte(14)
      ..write(obj.views)
      ..writeByte(15)
      ..write(obj.downloads)
      ..writeByte(16)
      ..write(obj.collections)
      ..writeByte(17)
      ..write(obj.likes)
      ..writeByte(18)
      ..write(obj.comments)
      ..writeByte(19)
      ..write(obj.userId)
      ..writeByte(20)
      ..write(obj.user)
      ..writeByte(21)
      ..write(obj.userImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
