import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/main/screens/article/widgets/article_list.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';

class ArticleScreen extends StatelessWidget {
  static const String routeName = '/article';
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Berita & Kegiatan"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ArticleList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
