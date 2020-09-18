import 'package:flutter/material.dart';
import 'package:news_app/presentations/customs/news_details_page.dart';
import 'package:news_app/presentations/customs/news_title_card.dart';
import 'package:news_app/presentations/customs/scroll_button.dart';
import 'package:news_app/presentations/customs/store_observer.dart';
import 'package:news_app/stores/sports_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class SportsNewsTab extends StatefulWidget {
  @override
  _SportsNewsTabState createState() => _SportsNewsTabState();
}

class _SportsNewsTabState extends State<SportsNewsTab> {
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
        StoreObserver<SportsStore>(
          builder: (SportsStore sportsStore, BuildContext context) {
            return sportsStore.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Styles.RED_COLOR),
                    ),
                  )
                : sportsStore.sportsHeadlines.isEmpty
                ? Center(child: emptyPlaceholder)
                : ListView.builder(
                    controller: controller,
                    itemCount: sportsStore.sportsHeadlines.length,
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
                                          sportsStore.sportsHeadlines[index],
                                    )));
                          },
                          child: NewsTitleCard(
                            headline: sportsStore.sportsHeadlines[index],
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
    Provider.of<SportsStore>(context).fetchSportsNews();
  }
}
