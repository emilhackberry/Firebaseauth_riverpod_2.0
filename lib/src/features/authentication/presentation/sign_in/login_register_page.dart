import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_controller.dart';
import 'package:firebaseauth/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool textObscuration,
  ) {
    return TextField(
      obscureText: textObscuration,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _submitButton(loginValue) {
    return ElevatedButton(
      onPressed: () {
        ref.read(loginPageControllerProvider.notifier).loginOrCreateAccount(
              loginValue,
              controllerEmail,
              controllerPassword,
              context,
            );
      },
      child: Text(loginValue ? "Login" : "Register"),
    );
  }

  //the bottom text button that switches login/sign up screen
  Widget _loginOrRegisterButton(loginValue) {
    return TextButton(
      onPressed: () {
        ref.read(firebaseAuthenticationProvider.notifier).loginRegisterChange();
      },
      child: Text(loginValue ? "Register instead" : "Login instead"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = ref.watch(firebaseAuthenticationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase auth"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField("email", controllerEmail, false),
            _entryField("password", controllerPassword, true),
            _submitButton(isLogin),
            _loginOrRegisterButton(isLogin),
          ],
        ),
      ),
    );
  }
}
