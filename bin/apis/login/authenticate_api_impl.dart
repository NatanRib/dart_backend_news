import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/archtectural_contracts/services/authenticate_service.dart';
import '../../core/archtectural_contracts/apis/auth_api.dart';

class AuthenticateApiImpl implements AuthenticateApi {
  @override
  Router router;
  @override
  AuthenticateService authService;

  AuthenticateApiImpl({
    required this.router,
    required this.authService,
  });

  @override
  Handler call() {
    router.post('/login', (Request request) async {
      final bodyString = await request.readAsString();
      final body = jsonDecode(bodyString);
      final token = await authService.authorize(
          username: body['username'], password: body['password']);

      if (token.isNotEmpty) {
        //TODO: validation test
        //print('JWT valid: ${await authService.authentic(token)}');
        return Response.ok(jsonEncode({'token': token}));
      }
      return Response.forbidden(
          jsonEncode({'message': 'wrong username or password'}));
    });

    return router;
  }

  bool _isAuthenticate(String username, String pass) {
    //TODO: implement
    return true;
  }
}
