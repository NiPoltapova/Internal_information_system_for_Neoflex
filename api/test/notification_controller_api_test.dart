import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for NotificationControllerApi
void main() {
  final instance = Openapi().getNotificationControllerApi();

  group(NotificationControllerApi, () {
    //Future<BuiltList<MessageNotificationDTO>> getNotifications({ int limit }) async
    test('test getNotifications', () async {
      // TODO
    });

    //Future markAsRead(int id) async
    test('test markAsRead', () async {
      // TODO
    });

  });
}
