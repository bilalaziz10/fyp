import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wheat_disease_detection/componants/custom_main_button.dart';
import 'package:wheat_disease_detection/ui/image_classification_screen/image_classification_screen_controller.dart';

class ImageClassificationPage extends StatefulWidget {
  const ImageClassificationPage({super.key});

  @override
  ImageClassificationPageState createState() => ImageClassificationPageState();
}

class ImageClassificationPageState extends State<ImageClassificationPage> {
  ImageClassificationController controller =
      Get.put(ImageClassificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[300],
        title: Text(
          'Plant Detection',
          style: GoogleFonts.poppins(
              fontSize: 25.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                controller.image == null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          height: 350,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/search.jpeg'),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          height: 350,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(controller.image!),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: CustomMainButton(
                          title: 'Select from Gallery',
                          width: 306.w,
                          height: 38.h,
                          fontsize: 15,
                          onpressed: () {
                            controller.getImageFromGallery();
                          },
                          color: Colors.green,
                        ),
                      ),
                      Flexible(
                        child: CustomMainButton(
                          title: 'Take a Picture',
                          width: 306.w,
                          height: 38.h,
                          fontsize: 15,
                          onpressed: () {
                            controller.getImageFromCamera();
                          },
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomMainButton(
                  title: 'Process Image',
                  width: 306.w,
                  height: 38.h,
                  fontsize: 15,
                  onpressed: () {
                    controller.sendImage();
                  },
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  'Prediction ',
                  style: GoogleFonts.poppins(
                    fontSize: 35.sp,
                    color: Colors.black,
                  ),
                ),
                controller.prediction.value.isNotEmpty
                    ? Text(
                        controller.prediction.value,
                        style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          color: Colors.green,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
