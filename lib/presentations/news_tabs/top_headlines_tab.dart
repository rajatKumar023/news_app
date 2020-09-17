import 'package:flutter/material.dart';
import 'package:news_app/presentations/customs/news_title_card.dart';
import 'package:news_app/presentations/customs/scroll_button.dart';
import 'package:news_app/presentations/customs/store_observer.dart';
import 'package:news_app/stores/headlines_store.dart';
import 'package:provider/provider.dart';

import 'file:///E:/Flutter%20Projects/news_app/lib/presentations/customs/news_details_page.dart';

class TopHeadlinesTab extends StatefulWidget {
  @override
  _TopHeadlinesTabState createState() => _TopHeadlinesTabState();
}

class _TopHeadlinesTabState extends State<TopHeadlinesTab> {
  ScrollController controller;
  bool showScrollButton;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    showScrollButton = false;
    controller.addListener(() {
      if (controller.offset > 50) {
        setState(() {
          showScrollButton = true;
        });
      } else {
        setState(() {
          showScrollButton = false;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StoreObserver<HeadlinesStore>(
          builder: (HeadlinesStore headlinesStore, BuildContext context) {
            return headlinesStore.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : ListView.builder(
                    controller: controller,
                    itemCount: headlinesStore.topHeadlines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailsPage(
                                      headlines:
                                          headlinesStore.topHeadlines[index],
                                    )));
                          },
                          child: NewsTitleCard(
                            headline: headlinesStore.topHeadlines[index],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
        showScrollButton
            ? Positioned(
                bottom: 20,
                right: 20,
                child: ScrollButton(
                  onTap: () {
                    controller.animateTo(
                      0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }

  _getData() {
    Provider.of<HeadlinesStore>(context).fetchHeadlines();
  }
}
