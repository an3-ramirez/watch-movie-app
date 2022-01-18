class AuthenticationService {
  Future<bool> login(String name, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (name == "maria" && password == "password") {
      return true;
    }
    return false;
  }
}
