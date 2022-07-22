import 'package:shelf/shelf.dart';
import 'package:shelf_router/src/router.dart';

import '../../core/archtectural_contracts/apis/api.dart';
import '../../core/archtectural_contracts/services/service.dart';
import '../../models/news_model.dart';

class FindOneNewsApi implements Api<NewsModel> {
  @override
  Router router;
  @override
  Service<NewsModel> service;

  FindOneNewsApi({
    required this.router,
    required this.service,
  });

  @override
  Handler call() {
    router.get('/news/<id>', (Request request, String id) {
      //TODO: service.findOne(id);
      final jwtId = request.context['jwt'];
      print(jwtId);
      return Response.ok('seu id: $id');
    });
    return router;
  }
}
