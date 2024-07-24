import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheat_disease_detection/componants/bottom_curve_clipper';

import 'package:wheat_disease_detection/componants/coustom_back_button.dart';
import 'package:wheat_disease_detection/componants/custom_main_button.dart';
import 'package:wheat_disease_detection/componants/custom_password.dart';
import 'package:wheat_disease_detection/componants/custom_text_feild.dart';
import 'package:wheat_disease_detection/ui/auth_screens/auth_controller.dart';
import 'package:wheat_disease_detection/ui/auth_screens/forgot_screen.dart';
import 'package:wheat_disease_detection/ui/auth_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Image.asset(
                        'assets/loginBg.jpg',
                        width: double.infinity,
                        height: 250.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomBackButton(
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Login into your account',
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextFeild(
                  hint: 'Email',
                  icon: const Icon(Icons.person),
                  Controller: authController.emailC,
                ),
                SizedBox(height: 20.h),
                CustomPasswordFeild(
                  hint: 'Password',
                  icon: const Icon(Icons.lock),
                  Controller: authController.passC,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => const FogotPasswordScreen());
                    },
                  ),
                ),
                SizedBox(height: 45.h),
                CustomMainButton(
                  title: 'Login',
                  width: 306.w,
                  height: 38.h,
                  fontsize: 15,
                  onpressed: () {
                    authController.login();
                  },
                  color: Colors.green,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.to(() => const SignupScreen());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
