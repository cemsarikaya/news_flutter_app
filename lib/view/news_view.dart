import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/product/constant/padding_items.dart';
import 'package:news_flutter_app/product/constant/project_items.dart';
import 'package:news_flutter_app/product/service/project_dio.dart';
import 'package:news_flutter_app/view/news_details_view.dart';
import 'package:news_flutter_app/viewModel/news_provider.dart';
import 'package:news_flutter_app/viewModel/news_viewmodel.dart';

import '../product/constant/image_asset.dart';
import '../product/constant/text_item.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends NewsViewModel with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProjectItems.projectName),
      ),
      body: Padding(
        padding: PaddindUtility().paddingOnly,
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              NewsProvider(newsService).fetch();
            });
          },
          child: ListView.builder(
            itemCount: resources.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  await Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NewsDetailsView(path: [resources[index]])));
                },
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(children: [
                    Padding(
                      padding: PaddindUtility().paddingGeneral,
                      child: Text(
                        resources[index].title ?? '',
                        style: kTitleText,
                      ),
                    ),
                    Padding(
                      padding: PaddindUtility().paddingGeneral,
                      child: CachedNetworkImage(
                        imageUrl: resources[index].urlToImage ?? '',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(imagePath),
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
  }
}
