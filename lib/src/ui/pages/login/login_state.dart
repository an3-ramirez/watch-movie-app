import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/local/local.dart';
import 'package:watch_movie_app/src/domain/enums/enum_login_status.dart';

import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/models/auth_repository.dart';
import 'package:watch_movie_app/src/domain/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';
import 'package:watch_movie_app/src/domain/services/authentication_service.dart';

class LoginStateNotifier extends StateNotifier<Auth> {
  final Reader read;
  late LocalStore _localStore;

  LoginStateNotifier(this.read) : super(Auth()) {
    _localStore = read(localStoreProvider);
  }

  Future<AuthRepository> login(User user) async {
    state.status = LoginStatus.loading;
    AuthRepository auth = await read(authRepositoryProvider).login(user);

    if (auth.status) {
      state.status = LoginStatus.success;
      saveToken(auth.aditionalData);
    } else {
      state = Auth(status: LoginStatus.failed, message: auth.message);
    }

    return auth;
  }

  void logout() {
    _localStore.dete(tokenKey);
  }

  void saveToken(String token) {
    _localStore.write(tokenKey, token);
  }

  void checkUserLogged() {
    final String token = _localStore.read(tokenKey);
    if (token != '') {
      state.status = LoginStatus.success;
    }
  }
}

final StateNotifierProvider<LoginStateNotifier, Auth> loginStateProvider =
    StateNotifierProvider((ref) => LoginStateNotifier(ref.read));
