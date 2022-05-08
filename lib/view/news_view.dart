import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/product/service/project_dio.dart';
import 'package:news_flutter_app/service/news_service.dart';
import 'package:news_flutter_app/viewModel/news_provider.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> with ProjectDioMixin {
  final _imagePath = 'assets/images/ss.png';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(NewsService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Haberler'),
          ),
          body: Padding(
            padding: PaddindUtility().paddingOnly,
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  context.read<NewsProvider>().fetch();
                });
              },
              child: ListView.builder(
                itemCount: context.watch<NewsProvider>().resources.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(children: [
                        Padding(
                          padding: PaddindUtility().paddingGeneral,
                          child: Text(
                            context.watch<NewsProvider>().resources[index].title ?? '',
                          ),
                        ),
                        Padding(
                          padding: PaddindUtility().paddingGeneral,
                          child: CachedNetworkImage(
                            imageUrl: context.watch<NewsProvider>().resources[index].urlToImage ?? '',
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(_imagePath),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class PaddindUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddinBottom = const EdgeInsets.only(bottom: 20);
  final paddingOnly = const EdgeInsets.only(left: 10, right: 10);
  final paddingGeneral = const EdgeInsets.all(10);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}
