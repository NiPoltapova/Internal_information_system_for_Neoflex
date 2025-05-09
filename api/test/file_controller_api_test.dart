import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FileControllerApi
void main() {
  final instance = Openapi().getFileControllerApi();

  group(FileControllerApi, () {
    //Future<Uint8List> downloadFile(String filename) async
    test('test downloadFile', () async {
      // TODO
    });

  });
}
