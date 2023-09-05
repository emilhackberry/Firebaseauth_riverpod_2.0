import 'package:firebaseauth/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/src/features/authentication/data/firebase_authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: Should this be called LoginController? is this the controller?
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // void showSnackBarWithErrorMessage(errorMessage) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(errorMessage),
  //       action: SnackBarAction(
  //         label: 'OK',
  //         onPressed: () {},
  //       ),
  //     ),
  //   );
  // }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await FirebaseAuthentication().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (signInError) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, signInError.message as String));
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuthentication().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (createUserError) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarWithMessage(context, createUserError.message as String));
    }
  }

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
      onPressed: loginValue ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(loginValue ? "Login" : "Register"),
    );
  }

  //the bottom button that switches login/sign up screen
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
            _entryField("email", _controllerEmail, false),
            _entryField("password", _controllerPassword, true),
            _submitButton(isLogin),
            _loginOrRegisterButton(isLogin),
          ],
        ),
      ),
    );
  }
}
