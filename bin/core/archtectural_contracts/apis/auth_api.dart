import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/authenticate_service.dart';

abstract class AuthenticateApi {
  abstract Router router;
  abstract AuthenticateService authService;
  Handler call();
}
