class ArticleApi {
  String? message;
  bool? error;
  Data? data;

  ArticleApi({this.message, this.error, this.data});

  ArticleApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Articles>? articles;

  Data({this.articles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int? createdAt;
  int? updatedAt;
  String? sId;
  String? url;
  String? title;
  String? topic;
  String? author;
  String? image;

  Articles(
      {this.createdAt,
      this.updatedAt,
      this.sId,
      this.url,
      this.title,
      this.topic,
      this.author,
      this.image});

  Articles.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sId = json['_id'];
    url = json['url'];
    title = json['title'];
    topic = json['topic'];
    author = json['author'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['topic'] = this.topic;
    data['author'] = this.author;
    data['image'] = this.image;
    return data;
  }
}
