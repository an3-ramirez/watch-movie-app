import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  final movieApiKey = const String.fromEnvironment('movieApiKey',
      defaultValue: '4dc138c853e44e4ea1d3dfd746fe451d');
  final domainApi = const String.fromEnvironment('domainApi',
      defaultValue: 'https://api.themoviedb.org');
  final apiVersion =
      const String.fromEnvironment('apiVersion', defaultValue: '3');
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
