import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException ;
import 'package:flutter/foundation.dart' show immutable;

Map<String, AuthErrors> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorsNoCurrentUser(),
};

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

@immutable
class AuthErrorsUnknown extends AuthErrors{
  AuthErrorsUnknown(): super(
    dialogeText: 'Unknown authentication error occured!',
    dialogeTitle: 'Authentication Error',
  );
}

@immutable
class AuthErrorsNoCurrentUser extends AuthErrors{
  AuthErrorsNoCurrentUser(): super(
    dialogeTitle: 'No Current User!',
    dialogeText: 'No current user with this information was found!',

  );
}

// requires-recent-log
@immutable
class AuthErrorRequiresRecentLogin extends AuthErrors{
  AuthErrorRequiresRecentLogin(): super(
    dialogeTitle: 'Requires Recent Login!',
    dialogeText: 'You need to logout and login again to perform this action!',

  );
}

// operation-not-allowed
// Email- Authentication is not enabled yet!
@immutable
class AuthErrorOperationNotAllowed extends AuthErrors{
  AuthErrorOperationNotAllowed(): super(
    dialogeTitle: 'Operation not allowed!',
    dialogeText: 'You can not register using this method at this time!',

  );
}


// auth/user-not-found
@immutable
class AuthErrorUserNotFound extends AuthErrors{
  AuthErrorUserNotFound(): super(
    dialogeTitle: 'User Not Found!',
    dialogeText: 'This user is not found on server!',

  );
}
// auth/weak-password
@immutable
class AuthErrorWeakPassword extends AuthErrors{
  AuthErrorWeakPassword(): super(
    dialogeTitle: 'Weak Password!',
    dialogeText: 'Please chose a strong password consisting of more characters!',

  );
}
//invalid-email
@immutable
class AuthErrorInvalidEmail extends AuthErrors{
  AuthErrorInvalidEmail(): super(
    dialogeTitle: 'Invalid Email!',
    dialogeText: 'Please double check your email and try again!',

  );
}


// email-already-in-use
@immutable
class AuthErrorEmailAlreadyInUse extends AuthErrors{
  AuthErrorEmailAlreadyInUse(): super(
    dialogeTitle: 'Email already in use!',
    dialogeText: 'Please chose another email to register with!',
  );
}
