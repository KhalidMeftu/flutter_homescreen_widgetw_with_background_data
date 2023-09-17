import 'package:flutter/material.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'home_screen.dart';

class ArticleScreen extends StatefulWidget {
  final NewsData article;

  const ArticleScreen({
    super.key,
    required this.article,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.article.newsTitle),
          titleTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Updating home screen widget...'),
          ));

          updateHeadline(widget.article);
        },
        label: const Text('Update Homescreen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            widget.article.newsTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20.0),
          Text(widget.article.newsDetails),

        ],
      ),
    );
  }
}

