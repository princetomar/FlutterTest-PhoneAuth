import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_proj/view/verify_otp_view.dart';
import '../utils/app_constants.dart';
import '../utils/phone_input_field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // FOR PHONE NUMBER INPUT ============================================
  String selectedCountryCode = '+91';
  TextEditingController phoneNumberController = TextEditingController();
  // ===================================================================

  //FOR PAGE NAVIGATION ANIMATION ======================================
  double scaleFactor = 1;
  bool isVisible = true;

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.05,
          horizontal: size.width * 0.04,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                AppTextConstants.loginText,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.loginTextColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Image.asset("assets/mainImage.png"),
              SizedBox(
                height: size.height * 0.07,
              ),
              PhoneNumberInputField(
                phoneInputcontroller: phoneNumberController,
                selectedCountryCode: selectedCountryCode,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  scaleMethod();
                },
                child: Transform.scale(
                  scale: scaleFactor,
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
                      AppTextConstants.getOTPText,
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

  // Function for animating the screen transition with scaling effect
  scaleMethod() async {
    setState(() {
      isVisible = false;
    });

    // Increase the scale factor while navigating to the Verify OTP screen
    for (var i = 0; i < 200; i++) {
      await Future.delayed(const Duration(milliseconds: 2), () {
        setState(() {
          scaleFactor += 0.20;
        });
      });
    }
    // Navigating to the verify otp screen
    Navigator.of(context).push(_createRoute()).then((value) async => {
          // if navigating back to login screen, decrease the scale factor
          for (var i = 0; i < 200; i++)
            {
              await Future.delayed(const Duration(milliseconds: 2), () {
                setState(() {
                  scaleFactor -= 0.20;
                });
              }),
            },
          setState(() {
            isVisible = true;
          })
        });
  }

  // custom route for the screen transition with a scaling effect
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondryAnimation) =>
          VerifyOTPView(phoneNumber: phoneNumberController.text),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Using curve animation in transition builders
        const curve = Curves.fastEaseInToSlowEaseOut;
        final curvAnimation = CurvedAnimation(parent: animation, curve: curve);

        return ScaleTransition(
          scale: curvAnimation,
          child: child,
        );
      },
    );
  }
}
