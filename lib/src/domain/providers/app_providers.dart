import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_movie_app/src/data/data_source/local/local.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';

// Maneja el estado de la tab active de la barra de navegacion inferior
final activeTabBottomBarProvider = StateProvider.autoDispose<int>((_) => 0);

final sharedPreferences = FutureProvider<SharedPreferences>(
  (_) async => await SharedPreferences.getInstance(),
);

final localStoreProvider = Provider<LocalStore>(
  (ref) => LocalStore(ref.watch(sharedPreferences).value!),
);

// Verifica si existe un token para hacer el login
final userIsLogeed = FutureProvider<bool>((ref) async {
  await ref.watch(sharedPreferences.future);
  final localStore = ref.watch(localStoreProvider);
  return localStore.read(tokenKey) != '';
});
