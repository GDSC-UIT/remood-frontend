import 'package:flutter/cupertino.dart';
import 'package:remood/app/core/values/text_style.dart';

class titleLogin extends StatelessWidget {
  String text;
  titleLogin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.064),
      child: Text(
        text,
        style: CustomTextStyle.LoginHeading(),
      ),
    );
  }
}
