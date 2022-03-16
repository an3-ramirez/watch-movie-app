class AuthRepository {
  final String message, aditionalData;
  bool status;

  AuthRepository(
      {this.message = '', this.status = false, this.aditionalData = ''});
}
