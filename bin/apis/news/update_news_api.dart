import 'package:shelf/shelf.dart';
import 'package:shelf_router/src/router.dart';

import '../../core/archtectural_contracts/apis/api.dart';
import '../../core/archtectural_contracts/services/service.dart';

class UpdateNewsApi implements Api {
  @override
  Router router;

  @override
  Service service;

  UpdateNewsApi({required this.router, required this.service});

  @override
  Handler call() {
    router.put('/news/<id>', (Request request, String id) {
      //TODO: service.update(id);
      return Response.ok('seu id: $id');
    });
    return router;
  }
}
