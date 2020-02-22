import 'package:news_app/models/headlines.dart';
import 'package:news_app/services/api_service.dart';

class EverythingNewsService extends APIService {
  EverythingNewsService._();

  factory EverythingNewsService.getInstance() => _instance;
  static final EverythingNewsService _instance = EverythingNewsService._();

  Future<List<Headlines>> getEveryNews(Map<String, dynamic> params) async {
    try {
      final Map<String, dynamic> response =
          await get('/everything', params: params);

      List<dynamic> headlinesList = response['articles'];

      List<Headlines> list = List();
      headlinesList.forEach((headline) {
        headline.remove('source');
        list.add(Headlines.fromJson(headline));
      });
      return list;
    } catch (e) {
      print('error in fetching');
      throw e;
    }
  }
}
