import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/article_api.dart';
import 'package:remood/app/modules/suggestion/suggestion_controller.dart';
import 'package:remood/app/modules/suggestion/widgets/card_blog.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ListCardBlog extends StatelessWidget {
  const ListCardBlog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SuggestionController articleController = Get.find();
    Future<ArticleApi> fetchApiArticle(String topic) async {
      final response = await http.get(Uri.parse(
          "https://remood-backend.onrender.com/api/articles/all/topics?topics=$topic"));
      if (response.statusCode == 200) {
        return ArticleApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load data");
      }
    }

    Future<ArticleApi> fetchAllApiArticle() async {
      final response = await http.get(
          Uri.parse('https://remood-backend.onrender.com/api/articles/all'));
      if (response.statusCode == 200) {
        return ArticleApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load data");
      }
    }

    return SizedBox(
      height: screenHeight * 0.213,
      child: Obx(
        () => FutureBuilder(
            future: articleController.isPressedTitle.value == -1
                ? fetchAllApiArticle()
                : fetchApiArticle(articleController.topic.value),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    padding: const EdgeInsets.only(left: 28),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: (() => launchUrl(Uri.parse(
                            snapshot.data!.data!.articles![index].url!))),
                        child: CardBlog(
                          title: snapshot.data!.data!.articles![index].title!,
                          image: snapshot.data!.data!.articles![index].image!,
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) => const SizedBox(
                          width: 12,
                        )),
                    itemCount: snapshot.data!.data!.articles!.length);
              } else {
                print("failed");
              }
              return const CircularProgressIndicator();
            })),
      ),
    );
  }
}
