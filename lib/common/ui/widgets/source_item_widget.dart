import 'package:flutter/material.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';

class SourceItemWidget extends StatelessWidget {
  final NewsSourceEntity newsSourceEntity;

  const SourceItemWidget({Key? key, required this.newsSourceEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      newsSourceEntity.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newsSourceEntity.country,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        newsSourceEntity.language,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
