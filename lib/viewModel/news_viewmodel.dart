import 'package:news_flutter_app/product/loading_state.dart';
import 'package:news_flutter_app/model/resource_model.dart';
import 'package:news_flutter_app/product/service/project_dio.dart';
import 'package:news_flutter_app/service/news_service.dart';
import 'package:news_flutter_app/view/news_view.dart';

abstract class NewsViewModel extends LoadingStatfull<NewsView> with ProjectDioMixin {
  late final INewsService newsService;

  List<Articles> resources = [];
  @override
  void initState() {
    super.initState();
    newsService = NewsService(service);
    fetch();
  }

  Future<void> fetch() async {
    changeLoading();
    resources = (await newsService.fetchResourceItem())?.articles ?? [];
    changeLoading();
  }

  Future refresh() async {
    setState(() {
      fetch();
    });
  }
}
