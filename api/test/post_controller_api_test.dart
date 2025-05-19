import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PostControllerApi
void main() {
  final instance = Openapi().getPostControllerApi();

  group(PostControllerApi, () {
    //Future<PostDTO> createPost(String text, { BuiltList<MultipartFile> files }) async
    test('test createPost', () async {
      // TODO
    });

    //Future deletePost(int id) async
    test('test deletePost', () async {
      // TODO
    });

    //Future<PagePostResponseDTO> getAllPosts({ String sortBy, int page, int size }) async
    test('test getAllPosts', () async {
      // TODO
    });

    //Future<PostDTO> getPostById(int id) async
    test('test getPostById', () async {
      // TODO
    });

    //Future<PostDTO> updatePost(int id, { PostDTO postDTO, BuiltList<MultipartFile> files }) async
    test('test updatePost', () async {
      // TODO
    });

  });
}
