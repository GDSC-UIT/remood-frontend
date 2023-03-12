class TopicApi {
  String? message;
  bool? error;
  Data? data;

  TopicApi({this.message, this.error, this.data});

  TopicApi.fromJson(Map<String, dynamic> json) {
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
  List<String>? topics;

  Data({this.topics});

  Data.fromJson(Map<String, dynamic> json) {
    topics = json['topics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topics'] = this.topics;
    return data;
  }
}
