import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/modules/suggestion/widgets/title.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight * 0.057,
      child: Expanded(
        child: ListView.separated(
            padding: EdgeInsets.only(left: 25),
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return TitleContainer(
                text: "abcabc",
              );
            }),
            separatorBuilder: ((context, index) => SizedBox(
                  width: 6,
                )),
            itemCount: 3),
      ),
    );
  }
}
