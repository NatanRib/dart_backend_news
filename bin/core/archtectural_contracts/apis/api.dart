import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/service.dart';

abstract class Api<T> {
  abstract Router router;
  abstract Service<T> service;
  Handler call();
}
