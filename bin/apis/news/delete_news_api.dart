import 'package:shelf/shelf.dart';
import 'package:shelf_router/src/router.dart';

import '../../core/archtectural_contracts/apis/api.dart';
import '../../core/archtectural_contracts/services/service.dart';
import '../../models/news_model.dart';

class DeleteNewsApi implements Api<NewsModel> {
  @override
  Router router;

  @override
  Service<NewsModel> service;

  DeleteNewsApi({
    required this.router,
    required this.service,
  });

  @override
  Handler call() {
    router.delete('/news/<id>', (Request request, String id) {
      return Response.ok('Delecao para: $id');
    });
    return router;
  }
}
