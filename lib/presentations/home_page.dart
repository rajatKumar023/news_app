import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentations/news_tabs/education_news_tab.dart';
import 'package:news_app/presentations/news_tabs/entertainment_news_tab.dart';
import 'package:news_app/presentations/news_tabs/lifestyle_news_tab.dart';
import 'package:news_app/presentations/news_tabs/sports_news_tab.dart';
import 'package:news_app/presentations/news_tabs/technology_news_tab.dart';
import 'package:news_app/presentations/news_tabs/top_headlines_tab.dart';
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
      statusBarColor: Styles.BLACK_COLOR,
      statusBarIconBrightness: Brightness.light,
    ));
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Styles.BLACK_COLOR,
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
                  Tab(
                    text: 'Top-Headlines',
                  ),
                  Tab(
                    text: 'Sports',
                  ),
                  Tab(
                    text: 'Education',
                  ),
                  Tab(
                    text: 'Entertainment',
                  ),
                  Tab(
                    text: 'Technology',
                  ),
                  Tab(
                    text: 'Lifestyle',
                  ),
                ],
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
    return Card(
      color: Styles.BLACK_COLOR,
      elevation: 18,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
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
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Styles.WHITE_COLOR,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Styles.BLUE_COLOR,
                    ),
                  ),
                ),
              ),
//              SizedBox(
//                width: 15.0,
//              ),
//              InkWell(
//                onTap: () {
//                  _getData();
//                },
//                child: Container(
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    color: Styles.WHITE_COLOR,
//                  ),
//                  padding: EdgeInsets.all(5),
//                  child: Center(
//                    child: Icon(
//                      Icons.refresh,
//                      size: 20,
//                      color: Styles.BLUE_COLOR,
//                    ),
//                  ),
//                ),
//              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
