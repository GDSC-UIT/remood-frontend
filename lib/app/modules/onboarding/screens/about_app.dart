import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return Container(
              // Image

              // Paragraph

              // Dots

              // Next screen
              );
        },
      ),
    );
  }
}
