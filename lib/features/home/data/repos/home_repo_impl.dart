import 'package:dartz/dartz.dart';
import 'package:news/core/services/news_service.dart';
import 'package:news/features/home/data/models/article_model.dart';
import 'package:news/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final NewsService newsService;

  HomeRepoImpl(this.newsService);
  @override
  Future<Either<String, List<Article>>> fetchTopNews() async {
    try {
      var data = await newsService.getGeneralNews();

      List<Article> news = [];
      for (var articale in data['results']) {
        news.add(Article.fromJson(articale));
      }
      return right(news);
    } catch (e) {
      return left(e.toString());
    }
  }
}
