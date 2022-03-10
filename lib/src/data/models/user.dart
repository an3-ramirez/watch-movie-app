class User {
  final String name, password;

  User({
    required this.name,
    required this.password,
  });
}

User emptyUser() => User(name: '', password: '');
