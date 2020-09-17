import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentations/home_page.dart';
import 'package:news_app/stores/headlines_store.dart';
import 'package:news_app/stores/sports_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        Provider<HeadlinesStore>.value(value: HeadlinesStore()),
        Provider<SportsStore>.value(value: SportsStore()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.sourceSansPro().fontFamily,
        ),
        title: 'News',
        home: HomePage(),
      ),
    );
  }
}
