import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException ;
import 'package:flutter/foundation.dart' show immutable;

Map<String, AuthErrors> authErrorMapping = {};

@immutable
abstract class AuthErrors {
  final String dialogeTitle;
  final String dialogeText;
  AuthErrors({
    required this.dialogeTitle,
    required this.dialogeText,
  });

  factory AuthErrors.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      AuthErrorsUnknown();
}
