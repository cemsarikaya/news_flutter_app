import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  ResourceModel({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  factory ResourceModel.fromJson(dynamic json) {
    return _$ResourceModelFromJson(json);
  }
  String? _status;
  int? _totalResults;
  List<Articles>? _articles;
  ResourceModel copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) =>
      ResourceModel(
        status: status ?? _status,
        totalResults: totalResults ?? _totalResults,
        articles: articles ?? _articles,
      );
  String? get status => _status;
  int? get totalResults => _totalResults;
  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Articles {
  Articles({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  factory Articles.fromJson(dynamic json) {
    return _$ArticlesFromJson(json);
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;
  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      Articles(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );
  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    return _$ArticlesToJson(this);
  }
}

@JsonSerializable()
class Source {
  Source({
    dynamic id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  factory Source.fromJson(dynamic json) {
    return _$SourceFromJson(json);
  }
  dynamic _id;
  String? _name;
  Source copyWith({
    dynamic id,
    String? name,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
      );
  dynamic get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    return _$SourceToJson(this);
  }
}
