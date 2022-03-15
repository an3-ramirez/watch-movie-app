import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_movie_app/src/data/data_source/local/local.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';

// Maneja el estado de la tab active de la barra de navegacion inferior
final activeTabBottomBarProvider = StateProvider.autoDispose<int>((_) => 0);

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (_) async => await SharedPreferences.getInstance(),
);

final localStoreProvider = Provider<LocalStore>(
  (ref) => LocalStore(ref.watch(sharedPreferencesProvider).value!),
);

// Verifica si existe un token para hacer el login
final userIsLoggedProvider = FutureProvider<bool>((ref) async {
  await ref.watch(sharedPreferencesProvider.future);
  final localStore = ref.watch(localStoreProvider);
  return localStore.read(tokenKey) != '';
});
