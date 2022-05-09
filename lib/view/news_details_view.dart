import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/product/constant/image_asset.dart';
import 'package:news_flutter_app/product/constant/padding_items.dart';
import 'package:news_flutter_app/product/constant/project_items.dart';
import 'package:news_flutter_app/product/constant/text_item.dart';
import '../model/resource_model.dart';
import 'package:kartal/kartal.dart';

class NewsDetailsView extends StatefulWidget {
  final List<Articles> path;
  const NewsDetailsView({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  List<Articles> resources = [];
  @override
  void initState() {
    super.initState();

    resources = widget.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ProjectItems.projectName), actions: [
        IconButton(
            onPressed: () {
              '${resources.first.url}'.shareWhatsApp();
            },
            icon: const Icon(Icons.share_rounded))
      ]),
      body: Padding(
        padding: PaddindUtility().paddingOnly,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: PaddindUtility().paddingTop,
                child: Text(
                  resources.first.title.toString(),
                  style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: PaddindUtility().paddingTopBottom,
                child: CachedNetworkImage(
                  imageUrl: resources.first.urlToImage ?? '',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset(imagePath),
                ),
              ),
              Text(
                resources.first.description.toString(),
                style: kDescriptionText,
              ),
              Padding(
                padding: PaddindUtility().paddingButton,
                child: ElevatedButton(
                    onPressed: () {
                      '${resources.first.url}'.launchWebsite;
                    },
                    child: const Text('Web Sitesinde Görüntüle')),
              )
            ],
          )
        ]),
      ),
    );
  }
}
