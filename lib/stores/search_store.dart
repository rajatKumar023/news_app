import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  ObservableList<Headlines> searchHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  searchNews(String query, {bool force = false}) async {
    try {
      isLoading = true;
      List<Headlines> headlines = await everythingNewsService.getEveryNews({
        'q': query,
        'from': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'sortBy': 'publishedAt',
        'page': 1,
        'language': 'en',
      });
      searchNewsComplete(headlines);
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  searchNewsComplete(List<Headlines> headlines) {
    searchHeadlines.clear();
    searchHeadlines.addAll(headlines);
    isLoading = false;
  }
}
