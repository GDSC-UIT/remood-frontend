import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';

class ContactService {
  /// Introduction for contact content
  static String introduction = "To get in touch with us, send an email to "
      "$email. We'll do our best to respond to your message as soon as possible.";

  /// Email
  static const String email = "[thuyhienphanthi2004@gmail.com]";

  /// Head office address
  static String address =
      "Linh Trung Ward, Thu Duc District, Ho Chi Minh City, Viet Nam";

  /// Phone number
  static String phoneNumber = "+84 971 238 225 ";

  /// Return introduction widget as rich text
  static Widget get getIntro => RichText(
        text: TextSpan(
            style: CustomTextStyle.normalText(
              const Color(0xFF000000),
            ).copyWith(fontSize: 16),
            children: [
              const TextSpan(
                  text: "To get in touch with us, send an email to "),
              TextSpan(
                text: email,
                style: CustomTextStyle.normalText(const Color(0xFF000000))
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const TextSpan(
                  text:
                      ". We'll do our best to respond to your message as soon as possible."),
            ]),
      );
}
