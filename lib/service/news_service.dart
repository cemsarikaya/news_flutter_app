import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_flutter_app/product/model/resource_model.dart';

abstract class INewsService {
  INewsService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}

//enum _ReqRestPath { resource, apiKey }

class NewsService extends INewsService {
  NewsService(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    //final response = await dio.get('/${_ReqRestPath.resource.name}}');
    final response = await dio
        .get('/top-headlines', queryParameters: {'country': 'tr', 'apiKey': '88625bd6bf7746c3a673085bcff3d90b'});

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
