import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/styles.dart';

class NewsTitleCard extends StatelessWidget {
  NewsTitleCard({
    this.headline,
  });

  final Headlines headline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 18,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            margin: EdgeInsets.only(bottom: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Styles.WHITE_COLOR,
              ),
              constraints: BoxConstraints(minHeight: 200.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: headline.urlToImage != null
                    ? Image.network(
                        headline.urlToImage,
                        fit: BoxFit.fitWidth,
                      )
                    : Center(
                        child: Text('T'),
                      ),
              ),
            ),
          ),
          Text(
            headline.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Styles.WHITE_COLOR,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          _titleValueRow(
            headline.source?.name,
          )
        ],
      ),
    );
  }

  Widget _titleValueRow(String title) {
    return title != null
        ? Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Styles.GREEN_COLOR,
            ),
          )
        : SizedBox(
            width: 5,
          );
  }
}
