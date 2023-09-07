sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;
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
