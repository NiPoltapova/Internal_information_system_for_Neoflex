import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MessageControllerApi
void main() {
  final instance = Openapi().getMessageControllerApi();

  group(MessageControllerApi, () {
    //Future<MessageDTO> createMessage(int chatId, MessageCreateRequest messageCreateRequest) async
    test('test createMessage', () async {
      // TODO
    });

    //Future deleteMessage(int chatId, int messageId) async
    test('test deleteMessage', () async {
      // TODO
    });

    //Future<PageMessageDTO> getChatMessages(int chatId, { int page, int size, BuiltList<String> sort }) async
    test('test getChatMessages', () async {
      // TODO
    });

    //Future<MessageDTO> getMessage(int chatId, int messageId) async
    test('test getMessage', () async {
      // TODO
    });

    //Future<MessageDTO> updateMessage(int chatId, int messageId, MessageUpdateRequest updateRequest) async
    test('test updateMessage', () async {
      // TODO
    });

  });
}
