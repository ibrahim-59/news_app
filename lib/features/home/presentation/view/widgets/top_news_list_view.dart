import 'package:flutter/material.dart';
import 'package:news/core/widgets/image_container.dart';
import 'package:news/features/home/data/models/article_model.dart';
import 'package:news/features/home/presentation/view/article_screen.dart';

class TopNewsListView extends StatelessWidget {
  final List<Article> news;
  const TopNewsListView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: news.length,
        itemBuilder: ((context, index) {
          Article article = news[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArticleScreen(
                            article: article,
                          )));
            },
            child: Row(
              children: [
                ImageContainer(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(10.0),
                    borderRadius: 16,
                    imageUrl: article.imageUrl!),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        article.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${article.createdAt} hours ago',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
