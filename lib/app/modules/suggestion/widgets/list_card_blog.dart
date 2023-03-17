import 'package:flutter/cupertino.dart';
import 'package:remood/app/modules/suggestion/widgets/card_blog.dart';

class ListCardBlog extends StatelessWidget {
  const ListCardBlog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.213,
      child: Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 28),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return const CardBlog();
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    width: 12,
                  )),
              itemCount: 4)),
    );
  }
}
