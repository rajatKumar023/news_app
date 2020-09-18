import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'entertainment_store.g.dart';

class EntertainmentStore = _EntertainmentStore with _$EntertainmentStore;

abstract class _EntertainmentStore with Store {
  ObservableList<Headlines> entertainmentHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchEntertainmentNews({bool force = false}) async {
    try {
      if (entertainmentHeadlines.isEmpty || force) {
        isLoading = true;
        List<Headlines> headlines = await everythingNewsService.getEveryNews({
          'q': 'entertainment',
          'from': DateFormat('yyyy-mm-dd').format(DateTime.now()),
          'sortBy': 'publishedAt',
          'page': 1,
        });
        fetchEntertainmentNewsComplete(headlines);
      }
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchEntertainmentNewsComplete(List<Headlines> headlines) {
    entertainmentHeadlines.clear();
    entertainmentHeadlines.addAll(headlines);
    isLoading = false;
  }
}
