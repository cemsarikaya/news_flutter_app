import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_flutter_app/model/resource_model.dart';

abstract class INewsService {
  INewsService(this.dio);
  final Dio dio;

  Future<List<ResourceModel>?> fetchResourceItem();
}

enum _ReqRestPath { resource }

class NewsService extends INewsService {
  NewsService(Dio dio) : super(dio);

  @override
  Future<List<ResourceModel>?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqRestPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => ResourceModel(json)).toList();
      }
    }
    return null;
  }
}
