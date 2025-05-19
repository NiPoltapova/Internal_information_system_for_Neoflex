import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserControllerApi
void main() {
  final instance = Openapi().getUserControllerApi();

  group(UserControllerApi, () {
    //Future<UserDTO> adminCreateUser(UserExtendedDTO userExtendedDTO) async
    test('test adminCreateUser', () async {
      // TODO
    });

    //Future adminDeleteUser(int id) async
    test('test adminDeleteUser', () async {
      // TODO
    });

    //Future<BuiltList<UserExtendedDTO>> adminGetAllUsers() async
    test('test adminGetAllUsers', () async {
      // TODO
    });

    //Future<UserExtendedDTO> adminGetUser(int id) async
    test('test adminGetUser', () async {
      // TODO
    });

    //Future<UserDTO> adminUpdateUser(int id, UserDTO userDTO) async
    test('test adminUpdateUser', () async {
      // TODO
    });

    //Future<UserDTO> adminUploadAvatar(int id, MultipartFile file) async
    test('test adminUploadAvatar', () async {
      // TODO
    });

    //Future<BuiltList<UserDTO>> getAllUsers() async
    test('test getAllUsers', () async {
      // TODO
    });

    //Future<UserDTO> getCurrentUser() async
    test('test getCurrentUser', () async {
      // TODO
    });

    //Future<UserDTO> getUserById(int id) async
    test('test getUserById', () async {
      // TODO
    });

    //Future<PageUserDTO> searchByFIO(String query, { int page, int size }) async
    test('test searchByFIO', () async {
      // TODO
    });

    //Future<UserDTO> updateCurrentUser(UserDTO userDTO) async
    test('test updateCurrentUser', () async {
      // TODO
    });

    //Future<UserDTO> uploadAvatar(MultipartFile file) async
    test('test uploadAvatar', () async {
      // TODO
    });

  });
}
