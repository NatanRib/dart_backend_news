import 'dart:async';
import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../core/utils/env_loader.dart';
import '../security/router_validare.dart';

class AuthorizationValidateMiddleware {
  Middleware call() {
    return createMiddleware(
      requestHandler: (Request request) async {
        if (!RouterValidate.isPublicRoute(request.url.path)) {
          final String jwtKey = await EnvLoader.getValue('jwt_key');
          final String? authorizationHeader = request.headers['Authorization'];

          if (authorizationHeader != null &&
              authorizationHeader.startsWith('Bearer ')) {
            final token = authorizationHeader.substring(7);
            return _verifyJWT(token, jwtKey, request);
          }
          return Response.badRequest(
              body: jsonEncode(
                  {"message": "Your need provide a valid Bearer Token (JWT)"}));
        }
        return null;
      },
    );
  }

  FutureOr<Response?> _verifyJWT(String token, String jwtKey, Request request) {
    try {
      final jwt = JWT.verify(token, SecretKey(jwtKey));
      _addJWTOnContext(request, jwt);
      return null;
    } on JWTInvalidError {
      //TODO: error handler
      return Response.forbidden('');
    } on JWTExpiredError {
      //TODO: error handler
      return Response.forbidden('');
    } on JWTNotActiveError {
      //TODO: error handler
      return Response.forbidden('');
    } on JWTUndefinedError {
      //TODO: error handler
      return Response.forbidden('');
    } catch (e) {
      //TODO: error handler
      return Response.forbidden('');
    }
  }

  void _addJWTOnContext(Request request, JWT jwt) {
    request.change(context: {'jwt': jwt});
  }
}
