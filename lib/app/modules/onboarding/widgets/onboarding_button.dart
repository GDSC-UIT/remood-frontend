import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // TODO: Create button by Container
      width: 300,
      // Next screen
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Next"),
      ),
    );
  }
}
