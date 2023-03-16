import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/article_api.dart';
import 'package:remood/app/modules/suggestion/widgets/card_article.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Future<ArticleApi> randomArticle() async {
      final response = await http.get(Uri.parse(
          "https://remood-backend.onrender.com/api/articles/random?number=10"));
      if (response.statusCode == 200) {
        return ArticleApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load data");
      }
    }

    List<Color> colors = [
      const Color.fromRGBO(248, 225, 178, 1),
      const Color.fromRGBO(254, 201, 96, 1),
      AppColors.grey,
    ];
    return FutureBuilder<ArticleApi>(
        future: randomArticle(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Swiper(
              itemCount: 10,
              itemBuilder: (context, index) => Expanded(
                  child: InkWell(
                onTap: (() => launchUrl(
                    Uri.parse(snapshot.data!.data!.articles![index].url!))),
                child: CardArticle(
                  color: colors[2],
                  image: snapshot.data!.data!.articles![index].image!,
                  title: snapshot.data!.data!.articles![index].title!,
                ),
              )),
              layout: SwiperLayout.TINDER,
              itemHeight: screenHeight * 0.23,
              itemWidth: screenWidth * 0.9,
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}
