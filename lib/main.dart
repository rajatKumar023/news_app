import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentations/home_page.dart';
import 'package:news_app/stores/education_store.dart';
import 'package:news_app/stores/entertainment_store.dart';
import 'package:news_app/stores/headlines_store.dart';
import 'package:news_app/stores/lifestyle_store.dart';
import 'package:news_app/stores/search_store.dart';
import 'package:news_app/stores/sports_store.dart';
import 'package:news_app/stores/technology_store.dart';
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
        Provider<EducationStore>.value(value: EducationStore()),
        Provider<EntertainmentStore>.value(value: EntertainmentStore()),
        Provider<LifeStyleStore>.value(value: LifeStyleStore()),
        Provider<TechnologyStore>.value(value: TechnologyStore()),
        Provider<SearchStore>.value(value: SearchStore()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.sourceSansPro().fontFamily,
        ),
        title: 'Notify',
        home: HomePage(),
      ),
    );
  }
}
