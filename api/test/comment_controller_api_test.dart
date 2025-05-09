import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CommentControllerApi
void main() {
  final instance = Openapi().getCommentControllerApi();

  group(CommentControllerApi, () {
    //Future<CommentDTO> createComment(CommentDTO commentDTO) async
    test('test createComment', () async {
      // TODO
    });

    //Future deleteComment(int id) async
    test('test deleteComment', () async {
      // TODO
    });

    //Future<BuiltList<CommentDTO>> getAllComments() async
    test('test getAllComments', () async {
      // TODO
    });

    //Future<CommentDTO> getCommentById(int id) async
    test('test getCommentById', () async {
      // TODO
    });

  });
}
