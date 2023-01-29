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
      id: fields[0] as int,
      content: fields[2] as String,
      description: fields[3] as String,
      title: fields[1] as String,
      source: fields[6] as String,
      image: fields[4] as String,
      isFavourite: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewsLocalEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.isFavourite)
      ..writeByte(6)
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
