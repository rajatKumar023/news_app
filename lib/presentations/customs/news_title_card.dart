import 'package:flutter/material.dart';
import 'package:news_app/models/headlines.dart';

class NewsTitleCard extends StatelessWidget {
  NewsTitleCard({
    this.headline,
  });

  final Headlines headline;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 120.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                child: headline.urlToImage != null
                    ? Image.network(
                        headline.urlToImage,
                        fit: BoxFit.cover,
                        height: 120.0,
                      )
                    : Center(
                        child: Text('T'),
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  headline.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                _titleValueRow(
                  headline.source.name,
                ),
              ],
            ),
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
              color: Colors.blue,
            ),
          )
        : SizedBox(
            width: 5,
          );
  }
}
