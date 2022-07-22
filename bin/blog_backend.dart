import 'package:shelf/shelf.dart';
import 'infra/custom_server.dart';
import 'infra/pipeline_builder.dart';
import 'core/utils/env_loader.dart';

void main(List<String> arguments) async {
  //TODO: essa config é apenas para ambiente de dev
  EnvLoader.fromFile('.env-dev');

  final address = await EnvLoader.getValue('server_address');
  final port = await EnvLoader.getValue<int>('port');

  Handler pipeline = PipelineBuilder().getHandler();
  CustomServer server = CustomServer(address: address, port: port);

  await server.run(pipeline);
}
