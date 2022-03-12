import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:watch_movie_app/src/domain/enums/enum_login_status.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';

/* final userAuthProvider = StateProvider<Map<String, dynamic>>((_) => {
      'signedIn': false,
      'loaded': false,
      'status': LoginStatus.initialize,
    }); */

final userTokenProvider = StateProvider<String>((ref) {
  final localStore = ref.read(localStoreProvider);

  return localStore.read(tokenKey);
});
