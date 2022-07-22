import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../apis/login/authenticate_api_impl.dart';
import '../apis/news/delete_news_api.dart';
import '../apis/news/find_all_news_api.dart';
import '../apis/news/find_one_news_api.dart';
import '../apis/news/save_news_api.dart';
import '../apis/news/update_news_api.dart';
import '../core/archtectural_contracts/services/authenticate_service.dart';
import '../core/archtectural_contracts/services/service.dart';
import '../models/news_model.dart';
import '../services/login_service.dart';
import '../services/news_service.dart';
import 'middlewares/authorization_validate_middleware.dart';
import 'middlewares/response_config_middleware.dart';
import 'security/router_validare.dart';

class PipelineBuilder {
  Router router = Router();
  Service<NewsModel> newsService = NewsService();
  AuthenticateService authService = AuthenticateServiceImpl();

  Handler getHandler() {
    //APIs
    final authApi =
        AuthenticateApiImpl(router: router, authService: authService);
    final findAllNewsApi = FindAllNewsApi(router: router, service: newsService);
    final findOneNewsApi = FindOneNewsApi(router: router, service: newsService);
    final saveNewsApi = SaveNewsApi(router: router, service: newsService);
    final updateNewsApi = UpdateNewsApi(router: router, service: newsService);
    final deleteNewsApi = DeleteNewsApi(router: router, service: newsService);

    //Middlewares
    final responseConfigMiddleware = ResponseConfigMiddleware();
    final authValidateMiddleware = AuthorizationValidateMiddleware();

    Handler cascade = Cascade()
        .add(authApi())
        .add(findAllNewsApi())
        .add(findOneNewsApi())
        .add(saveNewsApi())
        .add(updateNewsApi())
        .add(deleteNewsApi())
        .handler;

    Handler pipeline = Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(responseConfigMiddleware())
        .addMiddleware(authValidateMiddleware())
        .addHandler(cascade);

    //add public routes to authorization ignore
    RouterValidate.addPublicRoutes(['login']);

    return pipeline;
  }
}
