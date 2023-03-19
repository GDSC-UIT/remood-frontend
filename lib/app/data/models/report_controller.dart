class reportController {
  int? point;
  String? topic;

  reportController({this.point, this.topic});

  reportController.fromJson(Map<String, dynamic> json) {
    point = json['point'];
    topic = json['topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['point'] = point;
    data['topic'] = topic;
    return data;
  }
}
