import 'package:flutter/material.dart';
import 'package:news_app/common/ui/widgets/source_item_widget.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';

final sources = [
  NewsSourceEntity(name: "name", language: "language", country: "country"),
  NewsSourceEntity(name: "name1", language: "language1", country: "country1"),
  NewsSourceEntity(name: "name2", language: "language2", country: "country2"),
];

class SourceListScreen extends StatelessWidget {
  const SourceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            SourceItemWidget(newsSourceEntity: sources[index]),
        itemCount: sources.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
