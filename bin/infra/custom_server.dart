import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  final String address;
  final int port;

  CustomServer({
    required this.address,
    required this.port,
  });

  Future<void> run(Handler handler) async {
    await shelf_io.serve(handler, address, port);
    print('Server running -> http://$address:$port');
  }
}
