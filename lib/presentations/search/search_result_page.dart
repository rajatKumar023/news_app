import 'package:flutter/material.dart';
import 'package:news_app/presentations/customs/news_details_page.dart';
import 'package:news_app/presentations/customs/news_title_card.dart';
import 'package:news_app/presentations/customs/scroll_button.dart';
import 'package:news_app/presentations/customs/store_observer.dart';
import 'package:news_app/stores/search_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({this.query});

  final String query;

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
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
      _getData(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 18,
          backgroundColor: Styles.BLACK_COLOR,
          title: Text(
            widget.query,
            style: TextStyle(
              fontSize: 18,
              color: Styles.WHITE_COLOR,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          color: Styles.BLACK_COLOR.withOpacity(0.8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    StoreObserver<SearchStore>(
                      builder: (SearchStore searchStore, BuildContext context) {
                        return searchStore.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Styles.RED_COLOR),
                                ),
                              )
                            : searchStore.searchHeadlines.isEmpty
                                ? Center(
                                    child: emptyPlaceholder,
                                  )
                                : ListView.builder(
                                    controller: controller,
                                    itemCount:
                                        searchStore.searchHeadlines.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                          bottom: 20.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewsDetailsPage(
                                                          headlines: searchStore
                                                                  .searchHeadlines[
                                                              index],
                                                        )));
                                          },
                                          child: NewsTitleCard(
                                            headline: searchStore
                                                .searchHeadlines[index],
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
                            right: 0,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getData(String query) {
    Provider.of<SearchStore>(context).searchNews(query);
  }
}
