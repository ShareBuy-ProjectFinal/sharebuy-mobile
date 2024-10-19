import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/user/user_model.dart';

class AuthRepository extends FetchClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // call api lưu user
      }
      return true;
    } catch (e) {
      log('Error when create user: $e');
    }
    return false;
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } catch (e) {
      log('Error when login: $e');
      return '';
    }
  }

  Future<UserModel> getMe({required String firebaseId}) async {
    try {
      final Response<dynamic> response = await super.getData(
        path: "/api/users/users/firebase/$firebaseId",
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      return UserModel();
    } catch (e) {
      log('Error when get me: $e');
      return UserModel();
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      log('Error when logout: $e');
      return false;
    }
  }
}
