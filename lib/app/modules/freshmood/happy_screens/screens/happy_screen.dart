import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/quote_model.dart';
import 'package:remood/app/global_widgets/to_suggestion_button.dart';
import 'package:remood/app/global_widgets/today_motivation.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HappyScreen extends StatefulWidget {
  const HappyScreen({super.key});

  @override
  State<HappyScreen> createState() => _HappyScreenState();
}

class _HappyScreenState extends State<HappyScreen> {
  var apiUrl = "https://quote-generator-iks2.onrender.com/api/?number=1";
  Future<QuoteModel> fetchPost() async {
    final response = await http.get(Uri.parse('$apiUrl'));
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController changeAsset = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// back button
          BackButtonContainer(),
          SizedBox(
            height: _screenHeight * 0.11,
          ),
// today's motivation
          Center(
            child: TodayMotivation(
              color: changeAsset.valueSlider.value < 60
                  ? AppColors.normalFace
                  : changeAsset.valueSlider.value < 80
                      ? AppColors.smileFace
                      : AppColors.happyFace,
            ),
          ),
          SizedBox(
            height: _screenHeight * 0.023,
          ),
// icon feelings
          Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.43),
            child: SizedBox(
              width: 56,
              height: 56,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  changeAsset.valueSlider.value < 60
                      ? Assets.normal
                      : changeAsset.valueSlider.value < 80
                          ? Assets.fun
                          : Assets.happy,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
// quote
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.18),
            child: Container(
                width: _screenWidth * 0.64,
                height: _screenHeight * 0.297,
                child: FutureBuilder<QuoteModel>(
                  future: fetchPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            ' "${snapshot.data!.data!.quotes![0].text!}"',
                            style: TextStyle(
                              fontSize: 20,
                              color: changeAsset.valueSlider.value < 60
                                  ? AppColors.normalFace
                                  : changeAsset.valueSlider.value < 80
                                      ? AppColors.smileFace
                                      : AppColors.happyFace,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding:
                                EdgeInsets.only(left: _screenWidth * 0.323),
                            child: Text(
                              "-${snapshot.data!.data!.quotes![0].author}-",
                              style: TextStyle(
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                color: changeAsset.valueSlider.value < 60
                                    ? AppColors.normalFace
                                    : changeAsset.valueSlider.value < 80
                                        ? AppColors.smileFace
                                        : AppColors.happyFace,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return SpinKitFadingCircle(
                      color: changeAsset.valueSlider.value < 60
                          ? AppColors.normalFace
                          : changeAsset.valueSlider.value < 80
                              ? AppColors.smileFace
                              : AppColors.happyFace,
                      size: 50.0,
                    );
                  },
                )),
          ),
          const Spacer(),
          Center(child: SuggestionButton()),
          SizedBox(
            height: _screenHeight * 0.04,
          )
        ],
      ),
    );
  }
}
