//not working, just crashes when thrown

sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException() : super('email-already-in-use', 'Email already in use');
}

class WeakPasswordException extends AppException {
  WeakPasswordException() : super('weak-password', 'Password is too weak');
}

class WrongPasswordException extends AppException {
  WrongPasswordException() : super('wrong-password', 'Wrong password');
}

class UserNotFoundException extends AppException {
  UserNotFoundException() : super('user-not-found', 'User not found');
}

class TestExc extends AppException {
  TestExc()
      : super('The password is invalid or the user does not have a password.',
            "The password is invalid or the user does not have a password.");
}
