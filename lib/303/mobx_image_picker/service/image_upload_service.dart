
import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<void> uploadImageToServer(Uint8List byteArray, String name) async {
   // final formData = FormData.fromMap({

   //   '': await MultipartFile.fromBytes(byteArray),
   // });
    dio.post("path", data: byteArray, onSendProgress: (int sent, int total){

    });
  }
}