import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<Map<String, dynamic>> getGeneralNews() async {
    var response = await dio.get(
        'https://newsdata.io/api/1/news?apikey=pub_2798692366f017c518c212fcc077ffd5f887a&country=eg&category=top');
    print(response.data);
    return response.data;
  }
}
