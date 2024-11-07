import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/user/user_model.dart';

class AuthRepository extends FetchClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> createUser(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        String? token = await userCredential.user!.getIdToken();
        FetchClient.token = token!;
        await saveUser(fullName: fullName, email: email, token: token);
      }
      return userCredential.user!.uid;
    } catch (e) {
      log('Error when create user: $e');
    }
    return '';
  }

  Future<bool> saveUser(
      {required String fullName,
      required String email,
      required String token}) async {
    try {
      final Response<dynamic> response = await super.postData(
        path: '/api/users/users',
        params: {
          "user_name": fullName,
          "full_name": fullName,
          "email": email,
          "role": "SHOP"
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      log('Error when save user: $e');
      return false;
    }
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? token = await userCredential.user!.getIdToken();
      FetchClient.token = token!;
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

  Future<bool> updateProfile({required UserModel user}) async {
    try {
      final Response<dynamic> response = await super.postData(
        path: '/api/users/users/${AuthBloc.currentUser?.id}',
        params: user.toJson(),
      );
      if (response.statusCode == 200) {
        AuthBloc.currentUser = UserModel.fromJson(response.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error when update profile: $e');
      return false;
    }
  }
}
