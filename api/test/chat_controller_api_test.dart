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

    //Future<ChatDTO> getChatById(int id) async
    test('test getChatById', () async {
      // TODO
    });

    //Future<PageChatSummaryDTO> getMyChats({ int page, int size, String search }) async
    test('test getMyChats', () async {
      // TODO
    });

    //Future<ChatDTO> updateChat(int id, ChatDTO chatDTO) async
    test('test updateChat', () async {
      // TODO
    });

  });
}
