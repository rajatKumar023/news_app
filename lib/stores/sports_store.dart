import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'sports_store.g.dart';

class SportsStore = _SportsStore with _$SportsStore;

abstract class _SportsStore with Store {
  ObservableList<Headlines> sportsHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchSportsNews({bool force = false}) async {
    try {
      if (sportsHeadlines.isEmpty || force) {
        isLoading = true;
        List<Headlines> headlines = await everythingNewsService.getEveryNews({
          'q': 'sports',
          'from': DateFormat('yyyy-MM-dd').format(DateTime.now()),
          'sortBy': 'publishedAt',
          'page': 1,
          'language': 'en',
        });
        fetchSportsNewsComplete(headlines);
      }
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchSportsNewsComplete(List<Headlines> headlines) {
    sportsHeadlines.clear();
    sportsHeadlines.addAll(headlines);
    isLoading = false;
  }
}
