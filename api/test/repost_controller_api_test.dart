import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for RepostControllerApi
void main() {
  final instance = Openapi().getRepostControllerApi();

  group(RepostControllerApi, () {
    //Future<RepostDTO> createRepost(RepostDTO repostDTO) async
    test('test createRepost', () async {
      // TODO
    });

    //Future deleteRepost(int id) async
    test('test deleteRepost', () async {
      // TODO
    });

    //Future<BuiltList<RepostDTO>> getAllReposts() async
    test('test getAllReposts', () async {
      // TODO
    });

    //Future<RepostDTO> getRepostById(int id) async
    test('test getRepostById', () async {
      // TODO
    });

  });
}
