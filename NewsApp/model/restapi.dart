// To parse this JSON data, do
//
//     final restApi = restApiFromJson(jsonString);

import 'dart:convert';

RestApi restApiFromJson(String str) => RestApi.fromJson(json.decode(str));

String restApiToJson(RestApi data) => json.encode(data.toJson());

class RestApi {
  RestApi({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  String totalResults;
  List<Article> articles;

  factory RestApi.fromJson(Map<String, dynamic> json) => RestApi(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  Id id;
  Name name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]],
    name: nameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id { THE_WALL_STREET_JOURNAL }

final idValues = EnumValues({
  "the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL
});

enum Name { THE_WALL_STREET_JOURNAL }

final nameValues = EnumValues({
  "The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
