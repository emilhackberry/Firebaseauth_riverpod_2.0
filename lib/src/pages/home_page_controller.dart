import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_authentication.dart';
import 'package:firebaseauth/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  FutureOr<void> build() {
    //
  }
  Future<void> signOut() async {
    final fireBaseAuth = ref.watch(firebaseAuthenticationProvider.notifier);
    if (fireBaseAuth.currentUser != null) {
      await fireBaseAuth.signOut();
    }
  }
}
