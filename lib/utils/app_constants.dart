import 'package:flutter/material.dart';

class AppColors {
  static const Color loginTextColor = Colors.black;
  static const Color hintTextColor = Colors.grey;
  static const Color loginGetOTPTextColor = Colors.white;
  static Color loginPhoneInputFieldBGColor = Colors.grey.shade200;
  static Color loginGetOTPButtonColor = Color.fromRGBO(198, 70, 55, 0.9);
}

class AppTextConstants {
  // LOGIN SCREEN TEXTS
  static const String loginText = "Log in";
  static const String getOTPText = "Get OTP";
  static const String termsAndConditions =
      "By signing up, you agree with out Terms and conditions";

  // VERIFY OTP SCREEN TEXTS
  static const String otpVerifyTitle = "OTP Verify";
  static const String otpSentTo = "OTP Sent to";
  static const String verifyOTP = "Verify OTP";
  static const String detailsSubmitted = "Your details has been submitted";
}
