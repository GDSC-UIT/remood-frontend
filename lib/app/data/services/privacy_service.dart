import '../models/privacy.dart';

class PrivacyService {
  /// Show the introduce of the privacy
  static String intro =
      "Welcome to our App which is designed to help you track your emotions and improve your mood. "
      "By using our app, you agree to the following terms of use:";

  /// Show the conclusion of the privacy
  static String conclusion =
      "Thank you for using our App. We hope it helps you achieve your emotional wellness goals.";

  /// This show all privacy of Remood, includes
  /// 1. Eligibility
  /// 2. Disclaimer
  /// 3. Privacy
  /// 4. User Conduct
  /// 5. Intellectual Property
  static List<Privacy> contents = [
    Privacy(
      heading: "Eligibility",
      body: "You must be at least 16 years old to use our app. "
          "If you are under 16, you may only use our app with the permission and "
          "supervision of a parent or legal guardian.",
    ),
    Privacy(
      heading: "Disclaimer",
      body: "Our App is not intended to provide medical advice or diagnosis. "
          "It is designed to help you track your emotions and provide suggestions for improving your mood. "
          "Please consult a qualified medical professional if you have any concerns about your mental health.",
    ),
    Privacy(
      heading: "Privacy",
      body: "We take your privacy seriously."
          "We will never share your personal information with third parties without your consent. "
          "Please see our Privacy Policy for more information.",
    ),
    Privacy(
      heading: "User Conduct",
      body: "You agree to use our app only for its intended purpose. "
          "You will not use the app for any illegal or unauthorized purpose. "
          "You will not attempt to hack, modify, or otherwise interfere with the App's functionality.",
    ),
    Privacy(
        heading: "Intellectual Property",
        body:
            "Our App and all its contents are the property of our company and "
            "are protected by copyright and other intellectual property laws. "
            "You may not copy, distribute, or otherwise use our App or its contents without "
            "our express written permission."),
    Privacy(
        heading: "Changes to Terms of Use",
        body: "We reserve the right to "
            "update or modify these terms of use at anytime. Your continued use of our app after "
            "any such changes constitutes your acceptance of the new terms of use.")
  ];
}
