import 'dart:math';

import 'package:watch_movie_app/src/data/models/models.dart';

List<User> fakeUsers = [
  User(name: 'maria', password: 'password'),
  User(name: 'pedro', password: '123456')
];

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
