import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for WorkspaceControllerApi
void main() {
  final instance = Openapi().getWorkspaceControllerApi();

  group(WorkspaceControllerApi, () {
    //Future<WorkspaceDTO> createWorkspace(WorkspaceDTO workspaceDTO) async
    test('test createWorkspace', () async {
      // TODO
    });

    //Future deleteWorkspace(int id) async
    test('test deleteWorkspace', () async {
      // TODO
    });

    //Future<BuiltList<WorkspaceDTO>> getAllWorkspaces() async
    test('test getAllWorkspaces', () async {
      // TODO
    });

    //Future<BuiltList<WorkspaceDTO>> getAvailableWorkspaces() async
    test('test getAvailableWorkspaces', () async {
      // TODO
    });

    //Future<WorkspaceDTO> getWorkspaceById(int id) async
    test('test getWorkspaceById', () async {
      // TODO
    });

    //Future<WorkspaceDTO> updateWorkspace(int id, WorkspaceDTO workspaceDTO) async
    test('test updateWorkspace', () async {
      // TODO
    });

  });
}
