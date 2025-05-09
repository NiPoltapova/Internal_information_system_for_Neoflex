import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MessageControllerApi
void main() {
  final instance = Openapi().getMessageControllerApi();

  group(MessageControllerApi, () {
    //Future<MessageDTO> createMessage(String text, BuiltList<Uint8List> files, int chatId) async
    test('test createMessage', () async {
      // TODO
    });

    //Future deleteMessage(int id) async
    test('test deleteMessage', () async {
      // TODO
    });

    //Future<BuiltList<MessageDTO>> getAllMessages() async
    test('test getAllMessages', () async {
      // TODO
    });

    //Future<MessageDTO> getMessageById(int id) async
    test('test getMessageById', () async {
      // TODO
    });

    //Future<MessageDTO> updateMessage(int id, String newText, BuiltList<Uint8List> newFiles) async
    test('test updateMessage', () async {
      // TODO
    });

  });
}
