// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsLocalEntityAdapter extends TypeAdapter<NewsLocalEntity> {
  @override
  final int typeId = 0;

  @override
  NewsLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsLocalEntity(
      content: fields[1] as String,
      description: fields[2] as String,
      title: fields[0] as String,
      source: fields[5] as String,
      image: fields[3] as String,
      isFavourite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewsLocalEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.isFavourite)
      ..writeByte(5)
      ..write(obj.source);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
