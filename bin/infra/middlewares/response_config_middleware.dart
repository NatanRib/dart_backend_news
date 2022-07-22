import 'package:shelf/shelf.dart';

class ResponseConfigMiddleware {
  Middleware call() {
    return createMiddleware(
      responseHandler: (Response response) => response.change(
        headers: {'content-type': 'application/json'},
      ),
    );
  }
}
