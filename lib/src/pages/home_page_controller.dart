// ignore: unnecessary_import
import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_controller.dart';
import 'package:firebaseauth/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  FutureOr<void> build() {
    //
  }
  Future<void> signOut() async {
    final loginProvider = ref.read(loginPageControllerProvider(ref.watch(firebaseAuthRepositoryProvider)).notifier);
    if (loginProvider.firebaseAuthRepo.currentUser != null) {
      await loginProvider.firebaseAuthRepo.signOut();
    }
  }
}
