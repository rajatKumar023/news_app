import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'lifestyle_store.g.dart';

class LifeStyleStore = _LifeStyleStore with _$LifeStyleStore;

abstract class _LifeStyleStore with Store {
  ObservableList<Headlines> lifestyleHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchLifestyleNews({bool force = false}) async {
    try {
      if (lifestyleHeadlines.isEmpty || force) {
        isLoading = true;
        List<Headlines> headlines = await everythingNewsService.getEveryNews({
          'q': 'lifestyle',
          'from': DateFormat('yyyy-mm-dd').format(DateTime.now()),
          'sortBy': 'publishedAt',
          'page': 1,
        });
        fetchLifestyleNewsComplete(headlines);
      }
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchLifestyleNewsComplete(List<Headlines> headlines) {
    lifestyleHeadlines.clear();
    lifestyleHeadlines.addAll(headlines);
    isLoading = false;
  }
}
