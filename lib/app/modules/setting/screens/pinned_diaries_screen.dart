import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class PinnedDiariesScreen extends StatelessWidget {
  const PinnedDiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Pinned diaries";
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),

            // Nút filter positive & negative diary

            // Danh sách positive & negative diary

            // Ghim diary
          ],
        ),
      ),
    );
  }
}
