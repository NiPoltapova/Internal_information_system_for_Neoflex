import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ChatControllerApi
void main() {
  final instance = Openapi().getChatControllerApi();

  group(ChatControllerApi, () {
    //Future<ChatDTO> createChat(ChatDTO chatDTO) async
    test('test createChat', () async {
      // TODO
    });

    //Future deleteChat(int id) async
    test('test deleteChat', () async {
      // TODO
    });

    //Future<BuiltList<ChatDTO>> getAllChats() async
    test('test getAllChats', () async {
      // TODO
    });

    //Future<ChatDTO> getChatById(int id) async
    test('test getChatById', () async {
      // TODO
    });

  });
}
