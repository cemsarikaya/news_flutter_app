import 'package:news_flutter_app/product/model/resource_model.dart';

class ResourceContext {
  ResourceModel? model;

  void refresh(ResourceModel? model) {
    this.model = model;
  }
}
