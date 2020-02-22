import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/presentations/customs/news_title_card.dart';
import 'package:news_app/presentations/customs/store_observer.dart';
import 'package:news_app/stores/headlines_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getData(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            _appBar(),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Top-Headlines',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            _searchBar(),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: StoreObserver<HeadlinesStore>(
                builder: (HeadlinesStore headlinesStore, BuildContext context) {
                  return headlinesStore.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        )
                      : ListView.builder(
                          itemCount: headlinesStore.topHeadlines.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: NewsTitleCard(
                                headline: headlinesStore.topHeadlines[index],
                              ),
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(icon: Icon(Icons.clear_all), onPressed: () {}),
        Text(
          DateFormat.yMMMMd().format(DateTime.now()),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for topics, sources...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  _getData(BuildContext context) {
    Provider.of<HeadlinesStore>(context).fetchHeadlines();
  }
}
