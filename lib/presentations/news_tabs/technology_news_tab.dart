import 'package:flutter/material.dart';
import 'package:news_app/presentations/customs/news_details_page.dart';
import 'package:news_app/presentations/customs/news_title_card.dart';
import 'package:news_app/presentations/customs/scroll_button.dart';
import 'package:news_app/presentations/customs/store_observer.dart';
import 'package:news_app/stores/technology_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class TechnologyNewsTab extends StatefulWidget {
  @override
  _TechnologyNewsTabState createState() => _TechnologyNewsTabState();
}

class _TechnologyNewsTabState extends State<TechnologyNewsTab> {
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
        StoreObserver<TechnologyStore>(
          builder: (TechnologyStore technologyStore, BuildContext context) {
            return technologyStore.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Styles.RED_COLOR),
                    ),
                  )
                : technologyStore.technologyHeadlines.isEmpty
                ? Center(child: emptyPlaceholder)
                : ListView.builder(
                    controller: controller,
                    itemCount: technologyStore.technologyHeadlines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailsPage(
                                      headlines: technologyStore
                                          .technologyHeadlines[index],
                                    )));
                          },
                          child: NewsTitleCard(
                            headline:
                                technologyStore.technologyHeadlines[index],
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
    Provider.of<TechnologyStore>(context).fetchTechnologyNews();
  }
}
