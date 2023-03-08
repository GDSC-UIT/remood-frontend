import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';

class LoginBar extends StatelessWidget {
  const LoginBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(Assets.arrowBack))
            ],
          ),
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(Assets.logo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
