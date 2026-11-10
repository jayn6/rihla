import 'package:flutter/foundation.dart';

class ApiConfig {
  static const int port = 3000;

  static Duration get timeout => const Duration(seconds: 10);

  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:$port';
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'http://192.168.1.20:$port';
    }

    return 'http://localhost:$port';
  }
}