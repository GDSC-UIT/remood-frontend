import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/text_style.dart';

class AccountQuestion extends StatelessWidget {
  String question;
  String button;
  String route;
  AccountQuestion(
      {super.key,
      required this.question,
      required this.button,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: CustomTextStyle.AccountQuestion(),
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: (() {
            Get.toNamed(route);
          }),
          child: Text(
            button,
            style: CustomTextStyle.AccountButton(),
          ),
        )
      ],
    );
  }
}
