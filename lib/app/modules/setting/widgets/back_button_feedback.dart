import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonFeedback extends StatelessWidget {
  const BackButtonFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 20),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
