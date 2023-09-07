// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_register_controller.freezed.dart';
part 'login_register_controller.g.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLogin,
    String? email,
    String? password,
  }) = _LoginState;
}

@riverpod
class LoginPageController extends _$LoginPageController {
  @override
  LoginState build(FirebaseAuthRepository firebaseAuthRepo) {
    return const LoginState();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuthRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow; //TODO(Emil): deal with error handling
      // WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, signInError.message as String));
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuthRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow; //TODO(Emil): deal with error handling
      // WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, createUserError.message as String));
    }
  }

  Future<void> loginOrCreateAccount({
    required bool isLogin,
    required String email,
    required String password,
  }) {
    if (isLogin) {
      return signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      return createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  void toggleIsLogin() => state = state.copyWith(isLogin: !state.isLogin);

  late final StreamSubscription<User?>? _streamSubscription;
}
