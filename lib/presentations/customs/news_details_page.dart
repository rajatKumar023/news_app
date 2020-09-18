import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  NewsDetailsPage({this.headlines});

  final Headlines headlines;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Styles.BLACK_COLOR.withOpacity(0.8),
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        minHeight: screenHeight * 0.3,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      child: ClipPath(
                        child: headlines.urlToImage == null
                            ? Center(
                                child: Text(
                                  'Failed to load image!!!',
                                  style: TextStyle(
                                    color: Styles.WHITE_COLOR,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Image.network(
                                headlines.urlToImage,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: screenWidth,
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20.0,
                              ),
                              containerIcon(
                                iconData: Icons.arrow_back,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        headlines.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Styles.GREEN_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        StringValue.DESCRIPTION,
                        style: TextStyle(
                          fontSize: 18,
                          color: Styles.BLUE_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        headlines.content,
                        style: TextStyle(
                          fontSize: 15,
                          color: Styles.WHITE_COLOR,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        StringValue.MORE_INFO,
                        style: TextStyle(
                          fontSize: 18,
                          color: Styles.BLUE_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        headlines.description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Styles.WHITE_COLOR,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        StringValue.FULL_INFO_AT,
                        style: TextStyle(
                          fontSize: 18,
                          color: Styles.BLUE_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        onTap: () async {
                          if (await canLaunch(headlines.url)) {
                            await launch(headlines.url);
                          }
                        },
                        child: Text(
                          headlines.url,
                          style: TextStyle(
                            fontSize: 15,
                            color: Styles.WHITE_COLOR,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Center(
                        child: Text(
                          'Source\n\n${headlines.source?.name ?? 'No data'}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Styles.WHITE_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerIcon({IconData iconData, Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Styles.WHITE_COLOR,
        ),
        padding: EdgeInsets.all(5),
        child: Center(
          child: Icon(
            iconData,
            size: 18,
            color: Styles.BLACK_COLOR,
          ),
        ),
      ),
    );
  }
}
