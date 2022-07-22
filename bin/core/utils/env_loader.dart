import 'dart:io';
import 'parser_extension.dart';

class EnvLoader {
  static String _filePath = '.env';

  static Map<String, String> _envVariables = {};

  EnvLoader._();

  factory EnvLoader.fromFile(String filePath) {
    _filePath = filePath;
    return EnvLoader._();
  }

  static Future<String> _load() async {
    final file = await File(_filePath).readAsString();
    return file;
  }

  static Future<void> _read() async {
    final fileString = await _load();
    List<String> lines = fileString.split('\n');
    _envVariables = {
      for (final line in lines) line.split('=')[0]: line.split('=')[1]
    };
  }

  static Future<T> getValue<T>(String key) async {
    if (_envVariables.isEmpty) await _read();
    return _envVariables[key]?.toType(T);
  }
}

// void main(List<String> args) async {
//   final envLoader = EnvLoader();
//   final address = await envLoader.getValue('server_address');
//   final address_type = address.runtimeType;
//   print('$address tipo $address_type');
//   final port = await envLoader.getValue<int>('port');
//   final type = port.runtimeType;
//   print('$port tipo $type');
// }
