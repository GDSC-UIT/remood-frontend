import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24),
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
