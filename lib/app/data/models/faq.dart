import 'package:get/get.dart';

class FAQ {
  final String question;
  final String answer;
  RxBool isRead;
  FAQ({required this.question, required this.answer, required this.isRead});
}
