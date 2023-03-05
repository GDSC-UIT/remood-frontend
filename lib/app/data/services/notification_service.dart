import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static Future askPermissionFirstTime() async {
    PermissionStatus noticatePermission = await Permission.notification.status;

    if (noticatePermission.isGranted) {
      debugPrint("Permission is granted");
    } else if (noticatePermission.isDenied) {
      debugPrint("Permission is denied");
      if (await Permission.notification.request().isGranted) {
        debugPrint("Permission is granted");
      }
    }
  }

  static Future<bool> askPermissionThen(BuildContext context) async {
    PermissionStatus noticatePermission = await Permission.notification.status;

    if (noticatePermission.isGranted) {
      debugPrint("Permission is granted");
    } else if (noticatePermission.isDenied) {
      debugPrint("Permission is denied");
      if (!context.mounted) return false;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Permission is denied"),
          actions: [
            const Text("Unable to send notification. \n"
                "Go to Setting -> Application, \n"
                "then allow the notification permission."),
            ElevatedButton(
              onPressed: () => openAppSettings(),
              child: const Text("Open app setting"),
            )
          ],
        ),
      );
    }
    PermissionStatus status = await Permission.notification.status;
    return status.isGranted ? true : false;
  }
}
