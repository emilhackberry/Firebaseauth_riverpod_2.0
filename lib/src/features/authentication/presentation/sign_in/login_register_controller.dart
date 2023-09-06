import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_authentication.dart';
import 'package:firebaseauth/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_register_controller.g.dart';

@riverpod
class LoginPageController extends _$LoginPageController {
  @override
  FutureOr<void> build() {
    //
  }
  Future<void> signInWithEmailAndPassword(controllerEmail, controllerPassword, context) async {
    try {
      await ref.read(firebaseAuthenticationProvider.notifier).signInWithEmailAndPassword(
            email: controllerEmail.text,
            password: controllerPassword.text,
          );
    } on FirebaseAuthException catch (signInError) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, signInError.message as String));
    }
  }

  Future<void> createUserWithEmailAndPassword(controllerEmail, controllerPassword, context) async {
    try {
      await ref.read(firebaseAuthenticationProvider.notifier).createUserWithEmailAndPassword(
            email: controllerEmail.text,
            password: controllerPassword.text,
          );
    } on FirebaseAuthException catch (createUserError) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, createUserError.message as String));
    }
  }

  Future<void> loginOrCreateAccount(value, email, password, context) {
    if (value) {
      return signInWithEmailAndPassword(
        email,
        password,
        context,
      );
    } else {
      return createUserWithEmailAndPassword(
        email,
        password,
        context,
      );
    }
  }
}
