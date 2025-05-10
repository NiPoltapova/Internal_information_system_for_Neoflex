import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CommentControllerApi
void main() {
  final instance = Openapi().getCommentControllerApi();

  group(CommentControllerApi, () {
    //Future<CommentDTO> createComment(int postId, CommentDTO commentDTO) async
    test('test createComment', () async {
      // TODO
    });

    //Future deleteComment(int postId, int commentId) async
    test('test deleteComment', () async {
      // TODO
    });

    //Future<CommentDTO> getComment(int postId, int commentId) async
    test('test getComment', () async {
      // TODO
    });

    //Future<int> getCommentCount(int postId) async
    test('test getCommentCount', () async {
      // TODO
    });

    //Future<BuiltList<CommentDTO>> getComments(int postId) async
    test('test getComments', () async {
      // TODO
    });

    //Future<CommentDTO> updateComment(int postId, int commentId, CommentDTO commentDTO) async
    test('test updateComment', () async {
      // TODO
    });

  });
}
