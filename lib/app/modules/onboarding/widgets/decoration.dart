import 'package:flutter/material.dart';

class OnboardingDecoration extends BoxDecoration {
  static BoxDecoration imageBackround(String image) {
    return BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
