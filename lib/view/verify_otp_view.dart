import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_proj/utils/otp_input_field.dart';
import '../utils/app_constants.dart';

class VerifyOTPView extends StatefulWidget {
  final String phoneNumber;
  const VerifyOTPView({super.key, required this.phoneNumber});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  // CONTROLLERS AND OTP STRING =========
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered OTP code and it'll be displayed in a Text widget
  String? _otp;

  //==============================

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.03,
          horizontal: size.width * 0.04,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                AppTextConstants.otpVerifyTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.loginTextColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Image.asset("assets/mainImage.png"),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text(
                AppTextConstants.otpSentTo,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.hintTextColor,
                ),
              ),
              Text(
                widget.phoneNumber,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.loginTextColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, true), // auto focus
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        height: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/done.png",
                              height: 48,
                              width: 38,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Verified",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.loginGetOTPTextColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    AppTextConstants.detailsSubmitted,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.loginGetOTPTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.loginGetOTPButtonColor,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    border: Border.all(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                  child: Text(
                    AppTextConstants.verifyOTP,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.loginGetOTPTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        wordSpacing: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                ),
                child: Text(
                  AppTextConstants.termsAndConditions,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
