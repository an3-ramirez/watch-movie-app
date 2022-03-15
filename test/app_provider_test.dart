import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_movie_app/src/data/data_source/local/fake_data.dart';
import 'package:watch_movie_app/src/data/data_source/local/local.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';

void main() {
  test('fetch SharePreferences', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    SharedPreferences shared =
        await container.read(sharedPreferencesProvider.future);

    expectLater(
      shared,
      await SharedPreferences.getInstance(),
    );
  });

  test('fetch LocalStore', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container.read(sharedPreferencesProvider.future);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    LocalStore localStore = container.read(localStoreProvider);

    expect(
      localStore.read(tokenKey),
      LocalStore(sharedPreferences).read(tokenKey),
    );
  });

  group('status login user', () {
    test('user not logged in', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      LocalStore(sharedPreferences).write(tokenKey, '');

      expectLater(await container.read(userIsLoggedProvider.future), false);
    });

    test('user logged in', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      LocalStore(sharedPreferences).write(tokenKey, getRandomString(15));

      expectLater(await container.read(userIsLoggedProvider.future), true);
    });
  });
}
