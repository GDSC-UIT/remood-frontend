import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/suggestion/widgets/card_article.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({
    super.key,
  });

  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    List<Color> colors = [
      Color.fromRGBO(248, 225, 178, 1),
      Color.fromRGBO(254, 201, 96, 1),
      AppColors.grey,
    ];
    return Swiper(
      itemCount: 3,
      itemBuilder: (context, index) =>
          CardArticle(color: colors[index], index: index),
      layout: SwiperLayout.TINDER,
      itemHeight: _screenHeight * 0.21,
      itemWidth: _screenWidth * 0.83,
    );
  }
}
