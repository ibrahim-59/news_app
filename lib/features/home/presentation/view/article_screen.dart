import 'package:flutter/material.dart';
import 'package:news/core/widgets/image_container.dart';
import 'package:news/core/widgets/newes_body.dart';
import 'package:news/core/widgets/newes_headline.dart';
import 'package:news/features/home/data/models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            NewsHeadline(article: article),
            NewsBody(article: article),
          ],
        ),
      ),
    );
  }
}
