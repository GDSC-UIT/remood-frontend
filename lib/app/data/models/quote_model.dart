class QuoteModel {
  Data? data;
  bool? error;
  String? message;

  QuoteModel({this.data, this.error, this.message});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Quotes>? quotes;

  Data({this.quotes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(new Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  String? text;
  String? author;

  Quotes({this.text, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}
