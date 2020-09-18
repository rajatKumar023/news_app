import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentations/search/search_result_page.dart';
import 'package:news_app/utils/styles.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController controller;
  String query;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Styles.BLACK_COLOR.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 18,
                margin: EdgeInsets.all(0),
                color: Styles.BLACK_COLOR,
                child: Container(
                  height: 65.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          if (query.trim().length > 0) {
                            _navigateToResultPage(query.toLowerCase());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2),
                          child: Icon(
                            Icons.search,
                            color: Styles.WHITE_COLOR,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (String value) {
                            if (value.trim().length > 0) {
                              _navigateToResultPage(value.toLowerCase());
                            }
                          },
                          onChanged: (v) {
                            setState(() {
                              query = v;
                            });
                          },
                          style: TextStyle(
                            color: Styles.WHITE_COLOR,
                            fontSize: 17,
                          ),
                          cursorColor: Styles.WHITE_COLOR,
                          decoration: InputDecoration(
                            hintText: 'Search for any category',
                            hintStyle: TextStyle(
                              color: Styles.WHITE_COLOR,
                              fontSize: 17,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Top Categories:',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Styles.WHITE_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: GridView.builder(
                          controller: controller,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.7,
                          ),
                          itemCount: Styles.searchAssets.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                _navigateToResultPage(Styles
                                    .searchAssetsTag[index]
                                    .toLowerCase());
                              },
                              child: gridItem(
                                imageUrl: Styles.searchAssets[index],
                                text: Styles.searchAssetsTag[index],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gridItem({String imageUrl, String text}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Styles.WHITE_COLOR.withOpacity(0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
              color: Styles.WHITE_COLOR.withOpacity(0.8),
              child: Center(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _navigateToResultPage(String query) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultPage(
              query: query,
            )));
  }
}
