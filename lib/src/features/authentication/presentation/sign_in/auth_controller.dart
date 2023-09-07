// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  bool build(FirebaseAuthRepository firebaseAuthRepo) {
    firebaseAuthRepo.authStateChanges.listen(
      (user) {
        if (user != null) {
          state = true;
          return;
        }
        state = false;
        return;
      },
    );
    return false;
  }
}
