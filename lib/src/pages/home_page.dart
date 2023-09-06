import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_authentication.dart';
import 'package:firebaseauth/src/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithWelcomeMessage());
  }

  void showSnackBarWithWelcomeMessage() {
    FirebaseAuthentication auth = FirebaseAuthentication();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ref.read(firebaseAuthenticationProvider.notifier).checkIfUserIsNull(auth.currentUser),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  final User? user = FirebaseAuthentication().currentUser;

  Widget _title() {
    return const Text("Firebase Authentication");
  }

  Widget _userEmail() {
    return Text("Hello, ${user?.email}");
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: () {
        ref.read(homePageControllerProvider.notifier).signOut();
      },
      child: const Text("Sign out"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userEmail(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
