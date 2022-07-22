abstract class AuthenticateService {
  Future<String> authorize({
    required String username,
    required String password,
  });
}
