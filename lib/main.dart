import 'package:flutter/material.dart';
import 'package:news_app/presentations/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      home: HomePage(),
    );
  }
}
