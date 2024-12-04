import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:share_buy/helper/network/http_client.dart';

class UploadRepository extends FetchClient {
  Future<List<String>> uploadFile(List<File> images) async {
    try {
      List<String> result = await Future.wait(images.map((image) async {
        FormData formData = FormData.fromMap(
            {'file': await MultipartFile.fromFile(image.path)});
        final rep = await super.postData(
            domainApp: 'http://103.209.32.148:3000',
            path: '/upload',
            params: formData);

        if (rep.statusCode == 200) {
          return rep.data['url'];
        } else {
          return '';
        }
      }));
      return result;
    } catch (e) {
      log('Error when upload file: $e');
      return [];
    }
  }
}
