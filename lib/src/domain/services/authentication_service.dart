import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/local/fake_data.dart';
import 'package:watch_movie_app/src/data/models/models.dart';

class AuthenticationService {
  Future<bool> login(String name, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    User isName = fakeUsers.firstWhere(
      (element) => element.name == name,
      orElse: () => emptyUser(),
    );
    User isPassword = fakeUsers.firstWhere(
      (element) => element.password == password,
      orElse: () => emptyUser(),
    );
    if (isName.name != '' && isPassword.password != '') {
      return true;
    }
    return false;
  }
}

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService();
});
