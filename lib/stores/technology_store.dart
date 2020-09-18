import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'technology_store.g.dart';

class TechnologyStore = _TechnologyStore with _$TechnologyStore;

abstract class _TechnologyStore with Store {
  ObservableList<Headlines> technologyHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchTechnologyNews({bool force = false}) async {
    try {
      if (technologyHeadlines.isEmpty || force) {
        isLoading = true;
        List<Headlines> headlines = await everythingNewsService.getEveryNews({
          'q': 'technology',
          'from': DateFormat('yyyy-MM-dd').format(DateTime.now()),
          'sortBy': 'publishedAt',
          'page': 1,
        });
        fetchTechnologyNewsComplete(headlines);
      }
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchTechnologyNewsComplete(List<Headlines> headlines) {
    technologyHeadlines.clear();
    technologyHeadlines.addAll(headlines);
    isLoading = false;
  }
}
