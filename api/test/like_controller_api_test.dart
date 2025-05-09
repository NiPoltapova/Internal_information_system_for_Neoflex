import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for LikeControllerApi
void main() {
  final instance = Openapi().getLikeControllerApi();

  group(LikeControllerApi, () {
    //Future<LikeDTO> createLike(int postId) async
    test('test createLike', () async {
      // TODO
    });

    //Future deleteLike(int postId, int userId) async
    test('test deleteLike', () async {
      // TODO
    });

    //Future<PageLikeDTO> getLikesByPost(int postId, Pageable pageable) async
    test('test getLikesByPost', () async {
      // TODO
    });

    //Future<int> getLikesCount(int postId) async
    test('test getLikesCount', () async {
      // TODO
    });

  });
}
