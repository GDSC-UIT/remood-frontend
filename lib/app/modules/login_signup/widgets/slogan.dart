import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/text_style.dart';

class Slogan extends StatelessWidget {
  const Slogan({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.064),
      child: Text(
        "Empower your mental health journey with REMOOD - Your personal mood tracker",
        style: CustomTextStyle.LoginSlogan(),
      ),
    );
  }
}
