import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/headlines.dart';
import 'package:news_app/utils/globals.dart';

part 'education_store.g.dart';

class EducationStore = _EducationStore with _$EducationStore;

abstract class _EducationStore with Store {
  ObservableList<Headlines> educationHeadlines = ObservableList<Headlines>();

  @observable
  bool isLoading = false;

  @action
  fetchEducationNews({bool force = false}) async {
    try {
      if (educationHeadlines.isEmpty || force) {
        isLoading = true;
        List<Headlines> headlines = await everythingNewsService.getEveryNews({
          'q': 'education',
          'from': DateFormat('yyyy-mm-dd').format(DateTime.now()),
          'sortBy': 'publishedAt',
          'page': 1,
        });
        fetchEducationNewsComplete(headlines);
      }
    } catch (e) {
      print('error');
      isLoading = false;
      throw e;
    }
  }

  @action
  fetchEducationNewsComplete(List<Headlines> headlines) {
    educationHeadlines.clear();
    educationHeadlines.addAll(headlines);
    isLoading = false;
  }
}
