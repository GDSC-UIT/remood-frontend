import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/routes/app_routes.dart';

class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 22),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
