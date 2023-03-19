class TopicApi {
  String? message;
  bool? error;
  Data? data;

  TopicApi({this.message, this.error, this.data});

  TopicApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? topics;

  Data({this.topics});

  Data.fromJson(Map<String, dynamic> json) {
    topics = json['topics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topics'] = topics;
    return data;
  }
}
