import 'package:shelf/shelf.dart';
import 'package:shelf_router/src/router.dart';

import '../../core/archtectural_contracts/apis/api.dart';
import '../../core/archtectural_contracts/services/service.dart';
import '../../models/news_model.dart';

class SaveNewsApi implements Api<NewsModel> {
  @override
  Router router;

  @override
  Service<NewsModel> service;

  SaveNewsApi({required this.router, required this.service});

  @override
  Handler call() {
    router.post('/news', (Request request) {
      //TODO: service.save(model)
      return Response(201, body: null);
    });
    return router;
  }
}
