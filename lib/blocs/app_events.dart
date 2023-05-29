import 'package:flutter/foundation.dart' show immutable;

// Events

@immutable
abstract class AppEvents{
  const AppEvents();
}


@immutable
class AppEventsUploadImage implements AppEvents{
  final String imagePath;
  const AppEventsUploadImage({required this.imagePath});
}

@immutable
class AppEventsDeleteAccount implements AppEvents{
  const AppEventsDeleteAccount();
}

@immutable
class AppEventsLogOut implements AppEvents{
  const AppEventsLogOut();
}

@immutable
class AppEventsLogIn implements AppEvents{
  final String email;
  final String password;
  const AppEventsLogIn({required this.email,required this.password,});
}

@immutable
class AppEventsRegister implements AppEvents{
  final String email;
  final String password;
  const AppEventsRegister({required this.email,required this.password,});
}

@immutable
class AppEventsNavigateToRegister implements AppEvents{
  const AppEventsNavigateToRegister();
}