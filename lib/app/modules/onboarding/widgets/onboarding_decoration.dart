import 'package:flutter/cupertino.dart';

class OnboardingDecoration extends BoxDecoration {
  static BoxDecoration imageBackround(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
