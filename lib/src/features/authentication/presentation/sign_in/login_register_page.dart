import 'package:firebaseauth/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/auth_controller.dart';
import 'package:firebaseauth/src/features/authentication/presentation/sign_in/login_register_controller.dart';
import 'package:flutter/material.dart';
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

  Widget _submitButton({required bool isLogin}) {
    final loginProvider = ref.read(
      loginPageControllerProvider(
        ref.watch(firebaseAuthRepositoryProvider),
      ).notifier,
    );
    return ElevatedButton(
      onPressed: () {
        loginProvider.loginOrCreateAccount(
          isLogin: isLogin,
          email: controllerEmail.text,
          password: controllerPassword.text,
        );
      },
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  //the bottom text button that switches login/sign up screen
  Widget _loginOrRegisterButton({required bool isLogin}) {
    final loginProvider = ref.read(loginPageControllerProvider(
      ref.watch(firebaseAuthRepositoryProvider),
    ).notifier);
    return TextButton(
      onPressed: () {
        loginProvider.toggleIsLogin();
        // loginProvider.firebaseAuthRepo.authStateChanges.listen((user) {
        //   print(user?.email);
        // });
      },
      // onPressed: () => loginProvider.toggleIsLogin(),
      child: Text(isLogin ? "Register instead" : "Login instead"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase auth"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? _) {
            final loginProviderListener = ref.watch(loginPageControllerProvider(
              ref.watch(firebaseAuthRepositoryProvider),
            ));
            final isLogin = loginProviderListener.isLogin;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _entryField("email", controllerEmail, false),
                _entryField("password", controllerPassword, true),
                _submitButton(isLogin: isLogin),
                _loginOrRegisterButton(isLogin: isLogin),
              ],
            );
          },
        ),
      ),
    );
  }
}
