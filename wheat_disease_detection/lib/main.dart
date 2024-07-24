import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Classification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageClassificationPage(),
    );
  }
}

class ImageClassificationPage extends StatefulWidget {
  @override
  ImageClassificationPageState createState() => ImageClassificationPageState();
}

class ImageClassificationPageState extends State<ImageClassificationPage> {
  File? _image;
  final picker = ImagePicker();
  String? prediction;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future sendImage() async {
    if (_image != null) {
      String url = 'http://192.168.100.29:5000/predict';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('file', _image!.path));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          prediction = data['prediction'];
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Image Classification'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null ? Text('No image selected.') : Image.file(_image!),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: getImageFromGallery,
                    child: Text('Select from Gallery'),
                  ),
                  ElevatedButton(
                    onPressed: getImageFromCamera,
                    child: Text('Take a Picture'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendImage,
                child: Text('Analyze Image'),
              ),
              SizedBox(height: 20),
              prediction != null
                  ? Text(
                      'Prediction: $prediction',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
