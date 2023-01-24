import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui' as ui;

class FreshmoodPercent extends StatelessWidget {
  const FreshmoodPercent({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
        bottom: _screenHeight * 0.2,
        left: _screenWidth * 0.139,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Column(
            children: [
              const Text(
                "How was your day",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: _screenWidth * 0.723,
                height: _screenHeight * 0.134,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
        ));
    ;
  }
}
