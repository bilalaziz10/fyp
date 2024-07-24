import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheat_disease_detection/componants/coustom_back_button.dart';
import 'package:wheat_disease_detection/componants/custom_main_button.dart';
import 'package:wheat_disease_detection/componants/custom_password.dart';
import 'package:wheat_disease_detection/componants/custom_text_feild.dart';
import 'package:wheat_disease_detection/ui/auth_screens/auth_controller.dart';
import 'package:wheat_disease_detection/ui/auth_screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: CustomBackButton(
                    color: Colors.green.withOpacity(.3),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Create your new account',
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextFeild(
                  hint: 'Full Name',
                  icon: const Icon(Icons.person),
                  Controller: authController.nameC,
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    margin: EdgeInsets.all(15.sp),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          wordSpacing: 2.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'By Signing you agree to our ',
                            style: GoogleFonts.poppins(
                              color: Colors.green,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Team of use ',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: GoogleFonts.poppins(
                              color: Colors.green,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy notice ',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                CustomMainButton(
                  color: Colors.green,
                  title: 'SignUp',
                  width: 306.w,
                  height: 38.h,
                  fontsize: 15,
                  onpressed: () {
                    authController.signup();
                  },
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Text(
                        'Already have an account!',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        child: const Text(
                          "Login here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.offAll(() => const LoginScreen());
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
