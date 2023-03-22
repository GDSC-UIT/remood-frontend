import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:remood/app/data/models/diary_note_api.dart';
import 'package:remood/app/modules/home/home_controller.dart';

class HttpService {
  HomeController controller = Get.put(HomeController());
  Future<GetDiaryNote> fetchDiaryNote() async {
    final response = await http.get(
        Uri.parse("https://remood-backend.onrender.com/api/diary-notes/"),
        headers: {
          "Authorization": "Bearer ${controller.token.value}",
        });
    if (response.statusCode == 200) {
      return GetDiaryNote.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
