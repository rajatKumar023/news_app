import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentations/home_page.dart';
import 'package:news_app/stores/headlines_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        Provider<HeadlinesStore>.value(value: HeadlinesStore()),
      ],
      child: MaterialApp(
        title: 'News',
        home: HomePage(),
      ),
    );
  }
}
