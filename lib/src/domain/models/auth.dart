import 'package:watch_movie_app/src/domain/enums/enum_login_status.dart';

class Auth {
  LoginStatus status;
  String message;

  Auth({this.message = '', this.status = LoginStatus.initialize});
}
