import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  final SharedPreferences _store;

  LocalStore(this._store);

  String read(String key) {
    return _store.getString(key) ?? '';
  }

  void write(String key, String value) async {
    await _store.setString(key, value);
  }

  void dete(String key) async {
    await _store.remove(key);
  }
}
