class reportController {
  int? point;
  String? topic;

  reportController({this.point, this.topic});

  reportController.fromJson(Map<String, dynamic> json) {
    point = json['point'];
    topic = json['topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['point'] = this.point;
    data['topic'] = this.topic;
    return data;
  }
}
