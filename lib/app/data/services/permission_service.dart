import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class PermissionService {
  static Future askPermissionFirstTime() async {
    PermissionStatus noticatePermission =
        await Permission.notification.request();

    if (noticatePermission.isGranted) {
      debugPrint("Permission is granted");
    } else if (noticatePermission.isDenied) {
      debugPrint("Permission is denied");
    }
  }

  static TextSpan textSpanDialogContent = TextSpan(
    style: CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 11),
    children: const [
      TextSpan(
        text: "Unable to send notification. \n"
            "Go to Setting",
      ),
      WidgetSpan(
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 14,
        ),
      ),
      TextSpan(
          text: "Application, \n"
              "then allow the notification permission."),
    ],
  );

  static Future<bool> askPermissionThen(
      BuildContext context, bool mounted) async {
    PermissionStatus noticatePermission = await Permission.notification.status;

    if (noticatePermission.isGranted) {
      debugPrint("Permission is granted");
    } else if (noticatePermission.isDenied) {
      debugPrint("Permission is denied");
      if (!mounted) return false;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          titlePadding: const EdgeInsets.only(top: 16),
          contentPadding:
              const EdgeInsets.only(top: 10, left: 6, right: 6, bottom: 16),
          actionsPadding: const EdgeInsets.only(bottom: 10),
          title: Column(
            children: [
              Text(
                "Permission is denied",
                style:
                    CustomTextStyle.h3(Colors.black).copyWith(fontSize: 16.0),
              ),
              const Divider(
                color: Color(0xFFB3B1B0),
              ),
            ],
          ),
          content: RichText(
            textAlign: TextAlign.center,
            text: textSpanDialogContent,
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () => openAppSettings(),
                child: Container(
                  width: 255,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "Open app setting",
                    style: CustomTextStyle.h2(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    PermissionStatus status = await Permission.notification.status;
    return status.isGranted ? true : false;
  }
}
