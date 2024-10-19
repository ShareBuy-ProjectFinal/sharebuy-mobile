import 'package:share_buy/models/user/user_model.dart';

class AuthState {
  bool isLoading;
  bool isSuccess;
  bool isLogoutSuccess;

  UserModel user;

  AuthState(
      {this.isLoading = false,
      this.isSuccess = false,
      required this.user,
      this.isLogoutSuccess = false});

  AuthState copyWith(
      {bool? isLoading,
      bool? isSuccess,
      UserModel? user,
      bool? isLogoutSuccess}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isLogoutSuccess: isLogoutSuccess ?? this.isLogoutSuccess,
    );
  }
}
