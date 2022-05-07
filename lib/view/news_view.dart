import 'package:flutter/material.dart';
import 'package:news_flutter_app/viewModel/news_viewmodel.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends NewsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
