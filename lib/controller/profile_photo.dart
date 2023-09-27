import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../network/sharedPreferenceData/shared_preference_data.dart';

class ProfilePhotoController extends GetxController {
  var isLoading = false;
  File? imagePath;
  String? imageName;
  String? imageData;
  ImagePicker imagePicker = ImagePicker();

  //
  // File? _pickedFile;
  // File? get pickedFile=>pickedFile;
  //
  // Future<void> pickImage() async {
  //   var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
  //   _pickedFile = File(getImage!.path);
  // }


  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = File(getImage!.path);
    imageName = getImage.path.split('/').last;
    imageData = base64Encode(imagePath!.readAsBytesSync());
    print("imagePath -> RASM TANLANDI: $imagePath");
    print("imageName TANLANDI: $imageName");
    print("imageData TANLANDI: $imageData");
    update();
  }

  // uploadImage() async {
  //   isLoading = true;
  //   update();
  //   String id = await SharedPreferenceData.getId();
  //   String? token = await SharedPreferenceData.getToken();
  //
  //   var url = 'https://gennis.uz/api/update_photo_profile/$id';
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath("img", imagePath?.length().toString()??''));
  //   request.headers.addAll({
  //     "Content-type": "multipart/form-data",
  //     'Authorization': 'Bearer $token',
  //   });
  //   var response = request.send();
  //   if(response != null){
  //     isLoading = false;
  //     update();
  //     print('response Uploaded: $response');
  //   }
  //   return response;
  // }

  Future<void> uploadImages() async {
    isLoading = true;
    update();
    String id = await SharedPreferenceData.getId();
    String? token = await SharedPreferenceData.getToken();
    try {
      var responses = await http.post(Uri.parse('https://gennis.uz/api/update_photo_profile/$id'),
          body: jsonEncode({
            'image': imagePath
          }),
          headers: {
           "Content-type": "multipart/form-data",
           'Authorization': 'Bearer $token',
      }
      );
      print('res: $responses');
     var response = json.decode(responses.body);
      print('NetworkService response: $responses');
      print('NetworkService response.headers: ${responses.headers}');
      print('NetworkService response.statusCode: ${responses.statusCode}');
      print('NetworkService response.body: ${responses.body}');
      print('NetworkService response.request: ${responses.request}');
      print('NetworkService response.reasonPhrase: ${responses.reasonPhrase}');
      print('NetworkService response.persistentConnection: ${responses.persistentConnection}');
      if (response != null) {
        isLoading = false;
        update();
        print('response Uploaded: $response');
      } else {
        print('NOT Uploaded');
      }
    } catch (e) {
      print('XATOLIK RASM YUKLASHDA: $e');
    }
  }


  //
  // Future<void> upload() async {
  //   http.StreamedResponse response = await updateProfile(_pickedFile);
  //   isLoading = false;
  //   if (response.statusCode == 200) {
  //     // Map map = jsonDecode(await response.stream.bytesToString());
  //     // String message = map["message"];
  //     // _imagePath=message;
  //     // _pickedFile = null;
  //     //await getUserInfo();
  //     //print(message);
  //   } else {
  //     print("error posting the image");
  //   }
  //   update();
  //
  // }
  //
  // Future<http.StreamedResponse> updateProfile(File? data) async {
  //   String id = await SharedPreferenceData.getId();
  //   String? token = await SharedPreferenceData.getToken();
  //   http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('https://gennis.uz/api/update_photo_profile/$id'));
  //    request.headers.addAll(<String,String>{
  //      "Content-type": "application/json; charset=utf-8",
  //      'Authorization': 'Bearer $token'});
  //   if(GetPlatform.isMobile && data != null) {
  //     File _file = File(data.path);
  //     request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
  //   }
  //   // Map<String, String> _fields = Map();
  //   // _fields.addAll(<String, String>{
  //   //   'f_name': userInfoModel.fName,  'email': userInfoModel.email
  //   // });
  //   // request.fields.addAll(_fields);
  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }
}
