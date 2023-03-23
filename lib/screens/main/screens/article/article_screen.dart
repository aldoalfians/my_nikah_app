import 'package:flutter/material.dart';
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
          title: const Text("Artikel"),
        ),
        body: Center(
          child: Text("Artikel"),
        ),
      ),
    );
  }
}
