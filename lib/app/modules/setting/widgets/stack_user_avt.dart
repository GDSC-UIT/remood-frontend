import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/assets_images.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // User avatar
      Center(child: Image.asset(Assets.settingUserAvt)),

      // Edit button
      Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            log("Changed avt.");
          },
          child: Container(
            width: 20.83,
            height: 19.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
            ),
            child: Image.asset(Assets.edit),
          ),
        ),
      ),
    ]);
  }
}
