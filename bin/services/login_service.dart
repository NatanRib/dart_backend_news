import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../core/archtectural_contracts/services/authenticate_service.dart';
import '../core/utils/env_loader.dart';

class AuthenticateServiceImpl implements AuthenticateService {
  @override
  Future<String> authorize(
      {required String username, required String password}) async {
    //TODO: implement logic of authentication
    if (username == 'admin' && password == '12345') {
      return await _generateJWT('1');
    }
    return '';
  }

  Future<String> _generateJWT(String userId) async {
    //Generate JWT (payload and header)
    final jwt = JWT(
      {
        'user_id': userId,
        'iat': DateTime.now().millisecondsSinceEpoch,
        'roles': ['user']
      },
    );

    //Assign and cript JWT
    final token = jwt.sign(SecretKey(await _getJwtKey));
    return token;
  }

  //Get key of env file
  Future<String> get _getJwtKey async => await EnvLoader.getValue('jwt_key');
}
