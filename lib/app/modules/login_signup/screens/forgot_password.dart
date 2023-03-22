// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:remood/app/core/values/app_colors.dart';
// import 'package:remood/app/core/values/text_style.dart';
// import 'package:remood/app/modules/login_signup/login_controller.dart';
// import 'package:remood/app/modules/login_signup/widgets/account_question.dart';
// import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
// import 'package:remood/app/global_widgets/my_textfield.dart';
// import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
// import 'package:remood/app/modules/login_signup/widgets/title.dart';
// import 'package:remood/app/routes/app_routes.dart';
// import 'package:http/http.dart' as http;

// class ForgotPassWord extends StatefulWidget {
//   const ForgotPassWord({super.key});

//   @override
//   State<ForgotPassWord> createState() => _ForgotPassWordState();
// }

// class _ForgotPassWordState extends State<ForgotPassWord> {
//   TextEditingController emailController = TextEditingController();
//   void resetPassword(String email) async {
//     final respose = await http.put(Uri.parse(
//         "https://remood-backend.onrender.com/api/users/password/reset?email=$email"));
//     if (respose.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Send passwrod via email")));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Invalid email")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     LogInController logInController = Get.find<LogInController>();
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: AppColors.backgroundPage,
//       body: SingleChildScrollView(
//         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // logibar
//                 const Padding(
//                   padding: EdgeInsets.only(top: 25),
//                   child: LoginBar(),
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.062,
//                 ),

//                 //title login
//                 titleLogin(text: "Forgot\nPassword"),
//                 SizedBox(
//                   height: screenHeight * 0.031,
//                 ),

//                 // slogan
//                 const Slogan(),
//                 SizedBox(
//                   height: screenHeight * 0.043,
//                 ),
//                 MyTextField(
//                   hintText: "Email",
//                   obscureText: false,
//                   controller: emailController,
//                 ),
//                 MyTextField(
//                   hintText: "Email",
//                   obscureText: false,
//                   controller: emailController,
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.37,
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: screenWidth,
//               height: screenHeight,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   AccountQuestion(
//                       question: "Have an account?",
//                       button: "Login",
//                       route: AppRoutes.login),
//                   SizedBox(
//                     height: screenHeight * 0.02,
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: screenWidth * 0.059),
//                     child: GestureDetector(
//                       onTap: () {
//                         resetPassword(emailController.text.trim());
//                       },
//                       child: Container(
//                         height: screenHeight * 0.064,
//                         decoration: BoxDecoration(
//                           color: AppColors.mainColor,
//                           borderRadius: BorderRadius.circular(13),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Next",
//                             style: CustomTextStyle.TextLogin(Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
