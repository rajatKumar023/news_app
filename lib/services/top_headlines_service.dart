import 'package:news_app/models/headlines.dart';
import 'package:news_app/services/api_service.dart';

class TopHeadLinesService extends APIService {
  TopHeadLinesService._();

  factory TopHeadLinesService.getInstance() => _instance;
  static final TopHeadLinesService _instance = TopHeadLinesService._();

  Future<List<Headlines>> getHeadlines(Map<String, dynamic> params) async {
    try {
      final Map<String, dynamic> response =
          await get('/top-headlines', params: params);

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
