import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppEvents{
  const AppEvents();
}

@immutable
class AppEventsUploadImage implements AppEvents{
  final String imagePath;
  AppEventsUploadImage({required this.imagePath});
}