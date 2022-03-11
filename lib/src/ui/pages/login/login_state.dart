import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/enums/enum_login_status.dart';

import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';

class LoginStateCtrl extends ChangeNotifier {
  final ChangeNotifierProviderRef<LoginStateCtrl> ref;

  LoginStatus _status = LoginStatus.initialize;

  LoginStateCtrl(this.ref);

  Future<void> login(User user) async {
    _status = LoginStatus.loading;
  }

  void saveToken(String token) {
    final localStore = ref.read(localStoreProvider);
    localStore.write(tokenKey, token);
  }
}

final loginStateProvider = ChangeNotifierProvider((ref) => LoginStateCtrl(ref));
