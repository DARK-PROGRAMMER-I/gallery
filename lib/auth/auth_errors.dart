
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthErrors {
  final String dialogeTitle;
  final String dialogeText;
  AuthErrors({
    required this.dialogeTitle,
    required this.dialogeText,
  });
}
