import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';

class ProfilePhotoController extends GetxController {
  var isLoading = false;
  File? imagePath;
  String? imageName;
  String? imageData;
  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    imageName = getImage!.path.split('/').last;
    imagePath = File(getImage.path);
    imageData = base64Encode(imagePath!.readAsBytesSync());
    print("imagePath -> RASM TANLANDI: $imagePath");
    print("imageName TANLANDI: $imageName");
    update();
  }


  Future setProfilePhoto(BuildContext context) async {
    isLoading = true;
    update();
    String id = await SharedPreferenceData.getId();
    String? token = await SharedPreferenceData.getToken();

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('https://gennis.uz/api/update_photo_profile/$id'));
      request.headers.addAll({
        "Content-type": "multipart/form-data",
        'Authorization': 'Bearer $token'});
       if(GetPlatform.isMobile && imagePath != null) {
         File file = File(imagePath!.path);
         request.files.add(http.MultipartFile('file', file.readAsBytes().asStream(), file.lengthSync(), filename: file.path.split('/').last));
       }

      print("url:---> ${request.url}");
      print("files:---> ${request.files}");
      print("fields:---> ${request.fields}");
      print("headers:---> ${request.headers}");
      print("method:---> ${request.method}");
      print("path:---> ${imagePath!.path}");

    request.send().then((response) async {
      if (response.statusCode == 200) {
        _finish(context);
        isLoading = false;
        update();
        if (kDebugMode) {
          print(await response.stream.bytesToString());
          print("response PHOTO Uploaded: $response");
          print('response.reasonPhrase:--->${response.reasonPhrase}');
          print('response.stream:--->${response.stream}');
          print('response.headers:--->${response.headers}');
          print('response.request:--->${response.request}');
          print('response.statusCode:--->${response.statusCode}');
          print('response.contentLength:--->${response.contentLength}');
          print('response.isRedirect:--->${response.isRedirect}');}

      }else{
        print(await response.stream.bytesToString());
        print("response PHOTO Uploaded else: $response");
        print('response.reasonPhrase else:--->${response.reasonPhrase}');
        print('response.stream else:--->${response.stream}');
        print('response.headers else:--->${response.headers}');
        print('response.request else:--->${response.request}');
        print('response.statusCode else:--->${response.statusCode}');
        print('response.contentLength else:--->${response.contentLength}');
        print('response.isRedirect else:--->${response.isRedirect}');
      }
    });
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

}
