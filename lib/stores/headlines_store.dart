import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'headlines_store.g.dart';

class HeadlinesStore = _HeadlinesStore with _$HeadlinesStore;

abstract class _HeadlinesStore with Store {
  ObservableList<Headlines> topHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchHeadlines() async {
    try {
      isLoading = true;
      List<Headlines> headlines =
          await topHeadLinesService.getHeadlines({'country': 'in'});
      fetchHeadlinesComplete(headlines);
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchHeadlinesComplete(List<Headlines> headlines) {
    topHeadlines.addAll(headlines);
    isLoading = false;
  }
}
