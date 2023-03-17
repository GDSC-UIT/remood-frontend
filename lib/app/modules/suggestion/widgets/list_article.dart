import 'package:flutter/cupertino.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/suggestion/widgets/card_article.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<Color> colors = [
      const Color.fromRGBO(248, 225, 178, 1),
      const Color.fromRGBO(254, 201, 96, 1),
      AppColors.grey,
    ];
    return Swiper(
      itemCount: 3,
      itemBuilder: (context, index) =>
          Expanded(child: CardArticle(color: colors[index], index: index)),
      layout: SwiperLayout.TINDER,
      itemHeight: screenHeight * 0.23,
      itemWidth: screenWidth * 0.9,
    );
  }
}
