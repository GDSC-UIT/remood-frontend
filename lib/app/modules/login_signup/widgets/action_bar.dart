// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:remood/app/core/values/assets_images.dart';
// import 'package:remood/app/data/services/media_query_service.dart';
// import 'package:remood/app/routes/app_routes.dart';

// class LoginBar extends StatelessWidget {
//   const LoginBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var pctWidth = MediaQueryService().pctWidth(context);
//     var pctHeight = MediaQueryService().pctHeight(context);

//     return Container(
//       color: Colors.transparent,
//       child: Stack(
//         children: [
//           Get.currentRoute == AppRoutes.loginScreen
//               ? const SizedBox()
//               : Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: Image.asset(Assets.arrowBack))
//                   ],
//                 ),
//           // Logo
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: SizedBox(
//                   width: 103 * pctWidth,
//                   height: 38 * pctHeight,
//                   child: Image.asset(Assets.logoText),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
