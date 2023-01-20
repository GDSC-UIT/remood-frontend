import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';

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
  final controller = Get.find<OnboardingController>();
  final pageController = Get.find<PageController>();
  // Nhấn nút Next để chuyển trang
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          if (widget.pageIndex == (widget.content.length - 1).obs) {}
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
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
