import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/archtectural_contracts/apis/api.dart';
import '../../core/archtectural_contracts/services/service.dart';
import '../../models/news_model.dart';

class FindAllNewsApi implements Api<NewsModel> {
  @override
  Router router;
  @override
  Service<NewsModel> service;

  FindAllNewsApi({
    required this.router,
    required this.service,
  });

  @override
  Handler call() {
    router.get('/news', (Request request) {
      //TODO: service.findAll();
      return Response.ok('Aqui vai todas as noticias');
    });
    return router;
  }
}
