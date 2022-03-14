import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_movie_app/src/data/data_source/local/local.dart';

// Maneja el estado de la tab active de la barra de navegacion inferior
final activeTabBottomBarProvider = StateProvider.autoDispose<int>((_) => 0);

final sharedPreferences = FutureProvider<SharedPreferences>(
    (_) async => SharedPreferences.getInstance());

final localStoreProvider = Provider<LocalStore>(
  (ref) => LocalStore(ref.watch(sharedPreferences).value!),
);

//final checkUserIsLogeed = FutureProvider(_create)