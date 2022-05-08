import 'package:flutter/widgets.dart';
import 'package:news_flutter_app/product/model/resource_model.dart';
import 'package:news_flutter_app/service/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final INewsService newsService;

  List<Articles> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  NewsProvider(this.newsService) {
    fetch();
    notifyListeners();
  }

  Future<void> fetch() async {
    _changeLoading();
    resources = (await newsService.fetchResourceItem())?.articles ?? [];
    _changeLoading();
  }
}
