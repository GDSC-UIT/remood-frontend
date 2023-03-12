class reportPoint {
  String? message;
  bool? error;
  Data? data;

  reportPoint({this.message, this.error, this.data});

  reportPoint.fromJson(Map<String, dynamic> json) {
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
  DayReview? dayReview;

  Data({this.dayReview});

  Data.fromJson(Map<String, dynamic> json) {
    dayReview = json['day_review'] != null
        ? new DayReview.fromJson(json['day_review'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dayReview != null) {
      data['day_review'] = this.dayReview!.toJson();
    }
    return data;
  }
}

class DayReview {
  String? userId;
  int? date;
  double? point;

  DayReview({this.userId, this.date, this.point});

  DayReview.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['point'] = this.point;
    return data;
  }
}
