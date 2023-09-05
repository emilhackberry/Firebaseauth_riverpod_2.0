import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_authentication.g.dart';

//TODO: Is this supposed to be called "FirebaseAuthenticationRepository"??
@riverpod
class FirebaseAuthentication extends _$FirebaseAuthentication {
  //loginValue referred to in loginpage, value sets and changes register or login button/screen
  @override
  bool build() => true;
  void loginRegisterChange() => state = !state;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //this is used for the snackbar
  Text checkIfUserIsNull(user) {
    if (user != null) {
      return Text("Welcome, ${user.email}");
    } else {
      return const Text("User is null");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
