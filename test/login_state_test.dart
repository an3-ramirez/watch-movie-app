import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/local/fake_data.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/enums/enum_login_status.dart';
import 'package:watch_movie_app/src/domain/models/auth_repository.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';
import 'package:watch_movie_app/src/domain/services/authentication_service.dart';
import 'package:watch_movie_app/src/ui/pages/login/login_state.dart';

User fakeUser = User(name: 'name', password: 'password');
User fakeUserTwo = User(name: 'Jose', password: '123456');
void main() {
  test('loginStateProvider is initialize', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container.read(sharedPreferencesProvider.future);

    final loginState = container.read(loginStateProvider);

    expect(loginState.status, LoginStatus.initialize);
  });

  group('login function', () {
    test('login success', () async {
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(FakeRepository()),
        ],
      );
      addTearDown(container.dispose);

      await container.read(sharedPreferencesProvider.future);

      AuthRepository authRepository =
          await container.read(loginStateProvider.notifier).login(fakeUser);

      expect(authRepository.status, true);
    });

    test('login incorrect', () async {
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(FakeRepository()),
        ],
      );
      addTearDown(container.dispose);

      await container.read(sharedPreferencesProvider.future);

      final loginState = container.read(loginStateProvider.notifier);

      AuthRepository authRepository = await loginState.login(fakeUserTwo);

      expect(authRepository.status, false);
    });
  });
}

class FakeRepository implements AuthenticationService {
  @override
  Future<AuthRepository> login(User user) async {
    if (user.name == 'name' && user.password == 'password') {
      return AuthRepository(
          status: true, message: 'Success', aditionalData: getRandomString(15));
    } else {
      return AuthRepository(status: false, message: 'Datos incorrectos');
    }
  }
}
