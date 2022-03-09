import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  late final SharedPreferences _store;

  /* LocalStore({SharedPreferences? preferences})
      : _store = preferences ?? SharedPreferences.getInstance(); */

  String? read(String key) {
    return _store.getString(key);
  }
}
