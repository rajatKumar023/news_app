import 'package:flutter/material.dart';
import 'package:news_app/services/everything_news.dart';
import 'package:news_app/services/top_headlines_service.dart';
import 'package:news_app/utils/styles.dart';

final EverythingNewsService everythingNewsService =
    EverythingNewsService.getInstance();
final TopHeadLinesService topHeadLinesService =
    TopHeadLinesService.getInstance();

Widget emptyPlaceholder = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Icon(
      Icons.cloud_off,
      size: 50,
      color: Styles.WHITE_COLOR,
    ),
    Text(
      'No data found',
      style: TextStyle(
        color: Styles.WHITE_COLOR,
        fontSize: 18,
      ),
    ),
  ],
);
