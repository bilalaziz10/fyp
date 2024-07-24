import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheat_disease_detection/componants/coustom_back_button.dart';
import 'package:wheat_disease_detection/componants/custom_main_button.dart';
import 'package:wheat_disease_detection/componants/custom_text_feild.dart';
import 'package:wheat_disease_detection/ui/auth_screens/auth_controller.dart';

class FogotPasswordScreen extends StatelessWidget {
  const FogotPasswordScreen({super.key});

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
                  'Forget Password',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Enter your email',
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
                  Controller: authController.forgetC,
                ),
                SizedBox(
                  height: 200,
                ),
                CustomMainButton(
                  color: Colors.green,
                  title: 'Sand',
                  width: 306.w,
                  height: 38.h,
                  fontsize: 15,
                  onpressed: () {
                    authController.sendPasswordResetEmail();
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
