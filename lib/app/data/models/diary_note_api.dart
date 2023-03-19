class DiaryNoteApi {
  String? message;
  bool? error;
  Data? data;

  DiaryNoteApi({this.message, this.error, this.data});

  DiaryNoteApi.fromJson(Map<String, dynamic> json) {
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
  DiaryNote? diaryNote;

  Data({this.diaryNote});

  Data.fromJson(Map<String, dynamic> json) {
    diaryNote = json['diary_note'] != null
        ? DiaryNote.fromJson(json['diary_note'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (diaryNote != null) {
      data['diary_note'] = diaryNote!.toJson();
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
  String? content;
  List<String>? media;

  DiaryNote(
      {this.createdAt,
      this.updatedAt,
      this.sId,
      this.userId,
      this.topic,
      this.tag,
      this.content,
      this.media});

  DiaryNote.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sId = json['_id'];
    userId = json['user_id'];
    topic = json['topic'];
    tag = json['tag'];
    content = json['content'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['_id'] = sId;
    data['user_id'] = userId;
    data['topic'] = topic;
    data['tag'] = tag;
    data['content'] = content;
    data['media'] = media;
    return data;
  }
}
