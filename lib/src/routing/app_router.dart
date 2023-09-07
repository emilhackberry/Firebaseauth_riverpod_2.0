import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/auth_controller.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_controller.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_page.dart';
import 'package:firebaseauth/src/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  loginPage,
}

final goRouterProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    final isLoggedIn = ref.watch(authControllerProvider(ref.read(firebaseAuthRepositoryProvider)));
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      redirect: (context, state) {
        //if user is authenticated, go to home page
        if (isLoggedIn) {
          return '/home';
        } else {
          return '/';
        }
      },
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.loginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: AppRoute.home.name,
          builder: (context, state) => const HomePage(),
        )
      ],
      errorBuilder: (context, state) => const Center(child: Text("Not found!")),
    );
  },
);
