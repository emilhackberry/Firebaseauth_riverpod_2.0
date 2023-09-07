// import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
// import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_controller.dart';
// import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_page.dart';
// import 'package:firebaseauth/src/pages/home_page.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class WidgetTree extends ConsumerStatefulWidget {
//   const WidgetTree({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _WidgetTreeState();
// }

// Future<Widget?> getInitialPageWidget(ref) async {
//   final loginProvider = ref.read(loginPageControllerProvider(ref.watch(firebaseAuthRepositoryProvider)).notifier);
//   try {
//     final user = await loginProvider.firebaseAuthRepo.authStateChanges.first;
//     if (user?.email != null) {
//       return const HomePage();
//     } else {
//       return const LoginPage();
//     }
//   } catch (error) {
//     if (kDebugMode) print("Error: $error");
//     return null;
//   }
// }

// class _WidgetTreeState extends ConsumerState<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getInitialPageWidget(ref),
//         builder: (context, snapshot) {
//           return snapshot.data ?? const Text("Error template for snapshot data");
//         },
//       ),
//     );
//   }
// }
