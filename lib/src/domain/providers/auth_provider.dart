import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';

final saveUserTokenProvider = StateProvider.family<bool, String>((ref, token) {
  final localStore = ref.read(localStoreProvider);
  localStore.write(tokenKey, token);

  return true;
});

final userTokenProvider = StateProvider<String>((ref) {
  final localStore = ref.read(localStoreProvider);

  return localStore.read(tokenKey);
});
