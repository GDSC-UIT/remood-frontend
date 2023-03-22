import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/widgets/back_button_feedback.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://docs.google.com/forms/d/e/1FAIpQLSeSNcsUfjqMWFAVidx6d0oc_CvNK6hxmHSpEmdV9MGFGG6UjA/viewform?usp=sf_link'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPage,
        title: Text("Feedback", style: CustomTextStyle.h2(Colors.black)),
        centerTitle: true,
        leading: const BackButtonFeedback(),
        leadingWidth: 86,
        toolbarHeight: 78,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
