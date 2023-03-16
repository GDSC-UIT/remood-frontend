class GetDiaryNote {
  String? message;
  bool? error;
  Data? data;

  GetDiaryNote({this.message, this.error, this.data});

  GetDiaryNote.fromJson(Map<String, dynamic> json) {
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
  DiaryNote? diaryNote;

  Data({this.diaryNote});

  Data.fromJson(Map<String, dynamic> json) {
    diaryNote = json['diary_note'] != null
        ? new DiaryNote.fromJson(json['diary_note'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diaryNote != null) {
      data['diary_note'] = this.diaryNote!.toJson();
    }
    return data;
  }
}

class DiaryNote {
  int? createdAt;
  int? updatedAt;
  String? sId;
  String? userId;
  String? topic;
  String? tag;
  int? icon;
  int? iconColor;
  String? content;
  List<String>? media;

  DiaryNote(
      {this.createdAt,
      this.updatedAt,
      this.sId,
      this.userId,
      this.topic,
      this.tag,
      this.icon,
      this.iconColor,
      this.content,
      this.media});

  DiaryNote.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sId = json['_id'];
    userId = json['user_id'];
    topic = json['topic'];
    tag = json['tag'];
    icon = json['icon'];
    iconColor = json['icon_color'];
    content = json['content'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['topic'] = this.topic;
    data['tag'] = this.tag;
    data['icon'] = this.icon;
    data['icon_color'] = this.iconColor;
    data['content'] = this.content;
    data['media'] = this.media;
    return data;
  }
}
