import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/topic_api.dart';
import 'package:remood/app/modules/suggestion/suggestion_controller.dart';
import 'package:remood/app/modules/suggestion/widgets/title.dart';
import 'package:http/http.dart' as http;

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SuggestionController titleController = Get.find();
    Future<TopicApi> getAllTopic() async {
      final response = await http.get(Uri.parse(
          'https://remood-oze7nwnjba-as.a.run.app/api/articles/topics'));
      if (response.statusCode == 200) {
        return TopicApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    }

    return SizedBox(
      height: screenHeight * 0.057,
      child: FutureBuilder<TopicApi>(
        future: getAllTopic(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                padding: const EdgeInsets.only(left: 25),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() {
                      titleController.pressTitle(
                          index, snapshot.data!.data!.topics![index]);
                    }),
                    child: TitleContainer(
                      text: snapshot.data!.data!.topics![index],
                      currentIndex: titleController.isPressedTitle,
                      index: index,
                      isPressed: titleController.isPressed,
                    ),
                  );
                }),
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 6,
                    )),
                itemCount: snapshot.data!.data!.topics!.length);
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
