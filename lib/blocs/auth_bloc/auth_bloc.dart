import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_event.dart';
import 'package:share_buy/blocs/auth_bloc/auth_state.dart';
import 'package:share_buy/models/user/user_model.dart';
import 'package:share_buy/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(user: UserModel())) {
    on<EventCreateUser>(_createUser);
    on<EventGetCurrentUser>(_getCurrentUser);
    on<EventLogin>(_login);
    on<EventLogout>(_logout);
  }

  Future<void> _login(EventLogin event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      String fireBaseId = await AuthRepository()
          .login(email: event.email, password: event.password);
      if (fireBaseId.isNotEmpty) {
        add(EventGetCurrentUser(firebaseId: fireBaseId));
        emit(state.copyWith(isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, isSuccess: false));
      }
    } catch (e) {
      log('Error when login: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _createUser(EventCreateUser event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      String firebaseId = await AuthRepository().createUser(
          email: event.email,
          password: event.password,
          fullName: event.fullName);
      if (firebaseId.isNotEmpty) {
        add(EventGetCurrentUser(firebaseId: firebaseId));
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, isSuccess: false));
      }
    } catch (e) {
      log('Error when create user: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _getCurrentUser(EventGetCurrentUser event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      UserModel user =
          await AuthRepository().getMe(firebaseId: event.firebaseId);
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      log('Error when get current user: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _logout(EventLogout event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      bool isLogoutSuccess = await AuthRepository().logout();
      if (isLogoutSuccess) {
        emit(state.copyWith(isLoading: false, isLogoutSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, isLogoutSuccess: false));
      }
    } catch (e) {
      log('Error when logout: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
}
