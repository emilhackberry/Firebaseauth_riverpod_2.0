import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_register_controller.g.dart';

@riverpod
class IsLoginController extends _$IsLoginController {
  @override
  bool build() {
    return true;
  }

  void toggleIsLogin() => state = !state;
}

@riverpod
class LoginPageController extends _$LoginPageController {
  @override
  FutureOr<void> build(FirebaseAuthRepository firebaseAuthRepo) {}

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // try {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () {
        return firebaseAuthRepo.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // try {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () {
        return firebaseAuthRepo.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      },
    );
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

  // void toggleIsLogin() => state = state.copyWith(isLogin: !state.isLogin);

  late final StreamSubscription<User?>? _streamSubscription;
}
