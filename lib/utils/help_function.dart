import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HelpFunction {
  static removeFocus(BuildContext context) {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  static pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      // return await file.readAsBytes();
      return file;
    }
  }

  static pickMutiImage(int? limit) async {
    final ImagePicker imagePicker = ImagePicker();
    List<XFile>? file = await imagePicker.pickMultiImage(limit: limit ?? 5);
    if (file.isNotEmpty) {
      return file.map((e) async => await e.readAsBytes()).toList();
    }
  }
}
