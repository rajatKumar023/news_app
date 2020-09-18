import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentations/news_tabs/education_news_tab.dart';
import 'package:news_app/presentations/news_tabs/entertainment_news_tab.dart';
import 'package:news_app/presentations/news_tabs/lifestyle_news_tab.dart';
import 'package:news_app/presentations/news_tabs/sports_news_tab.dart';
import 'package:news_app/presentations/news_tabs/technology_news_tab.dart';
import 'package:news_app/presentations/news_tabs/top_headlines_tab.dart';
import 'package:news_app/presentations/search/search_page.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Styles.BLACK_COLOR.withOpacity(0.8),
      statusBarIconBrightness: Brightness.light,
    ));
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Styles.BLACK_COLOR.withOpacity(0.8),
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(0),
                color: Styles.BLACK_COLOR,
                elevation: 18,
                child: Column(
                  children: <Widget>[
                    _appBar(),
                    TabBar(
                      isScrollable: true,
                      controller: tabController,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      indicatorColor: Styles.GREEN_COLOR,
                      tabs: [
                        Tab(text: StringValue.TOP_HEADLINES),
                        Tab(text: StringValue.SPORTS),
                        Tab(text: StringValue.EDUCATION),
                        Tab(text: StringValue.ENTERTAINMENT),
                        Tab(text: StringValue.TECHNOLOGY),
                        Tab(text: StringValue.LIFESTYLE),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      TopHeadlinesTab(),
                      SportsNewsTab(),
                      EducationNewsTab(),
                      EntertainmentNewsTab(),
                      TechnologyNewsTab(),
                      LifestyleNewsTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Notify',
              style: TextStyle(
                color: Styles.WHITE_COLOR,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                _navigateToSearchPage();
              },
              icon: Icon(
                Icons.search,
                color: Styles.WHITE_COLOR,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  _navigateToSearchPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchPage()));
  }
}
