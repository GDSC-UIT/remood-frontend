import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/text_style.dart';

class titleLogin extends StatelessWidget {
  String text;
  titleLogin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: _screenWidth * 0.064),
      child: Text(
        text,
        style: CustomTextStyle.LoginHeading(),
      ),
    );
  }
}
