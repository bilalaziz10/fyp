import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageClassificationController extends GetxController {
  File? image;
  final picker = ImagePicker();
  var prediction = ''.obs;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update(); // Notify listeners about the update
    } else {
      print('No image selected.');
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update(); // Notify listeners about the update
    } else {
      print('No image selected.');
    }
  }

// api data sand
  Future sendImage() async {
    if (image != null) {
      String url = 'http://192.168.100.29:5000/predict';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('file', image!.path));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        prediction.value = data['prediction'];
        Get.snackbar(
          "Success",
          "Image successfully Uploded",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(.3),
        );
      } else {
        print('Error: ${response.reasonPhrase}');
        Get.snackbar(
          'Error',
          'response.reasonPhraser',
          backgroundColor: Colors.red.withOpacity(.3),
        );
      }
    } else {
      print('No image selected.');
    }
  }
}
