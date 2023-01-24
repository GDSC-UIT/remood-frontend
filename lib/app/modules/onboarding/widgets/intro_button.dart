import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class OnboardingButton extends StatefulWidget {
  const OnboardingButton({
    Key? key,
    required this.pageIndex,
    required this.content,
  }) : super(key: key);
  final RxInt pageIndex;
  final List<Onboarding> content;

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> {
  final pageController = Get.find<PageController>();

  void nextScreen() {
    if (widget.pageIndex == (widget.content.length - 1).obs) {
      Get.offAllNamed(AppRoutes.home);
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          nextScreen();
        },
        color: AppColors.mainColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Obx(
          () => Text(
            widget.pageIndex == (widget.content.length - 1).obs
                ? "Continue"
                : "Next",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
