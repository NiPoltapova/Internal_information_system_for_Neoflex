# openapi.api.WorkspaceControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createWorkspace**](WorkspaceControllerApi.md#createworkspace) | **POST** /api/workspaces | 
[**deleteWorkspace**](WorkspaceControllerApi.md#deleteworkspace) | **DELETE** /api/workspaces/{id} | 
[**getAllWorkspaces**](WorkspaceControllerApi.md#getallworkspaces) | **GET** /api/workspaces | 
[**getAvailableWorkspaces**](WorkspaceControllerApi.md#getavailableworkspaces) | **GET** /api/workspaces/available | 
[**getWorkspaceById**](WorkspaceControllerApi.md#getworkspacebyid) | **GET** /api/workspaces/{id} | 
[**updateWorkspace**](WorkspaceControllerApi.md#updateworkspace) | **PUT** /api/workspaces/{id} | 


# **createWorkspace**
> WorkspaceDTO createWorkspace(workspaceDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();
final WorkspaceDTO workspaceDTO = ; // WorkspaceDTO | 

try {
    final response = api.createWorkspace(workspaceDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->createWorkspace: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceDTO** | [**WorkspaceDTO**](WorkspaceDTO.md)|  | 

### Return type

[**WorkspaceDTO**](WorkspaceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWorkspace**
> deleteWorkspace(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();
final int id = 789; // int | 

try {
    api.deleteWorkspace(id);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->deleteWorkspace: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllWorkspaces**
> BuiltList<WorkspaceDTO> getAllWorkspaces()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();

try {
    final response = api.getAllWorkspaces();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->getAllWorkspaces: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;WorkspaceDTO&gt;**](WorkspaceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAvailableWorkspaces**
> BuiltList<WorkspaceDTO> getAvailableWorkspaces()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();

try {
    final response = api.getAvailableWorkspaces();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->getAvailableWorkspaces: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;WorkspaceDTO&gt;**](WorkspaceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWorkspaceById**
> WorkspaceDTO getWorkspaceById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();
final int id = 789; // int | 

try {
    final response = api.getWorkspaceById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->getWorkspaceById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**WorkspaceDTO**](WorkspaceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWorkspace**
> WorkspaceDTO updateWorkspace(id, workspaceDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceControllerApi();
final int id = 789; // int | 
final WorkspaceDTO workspaceDTO = ; // WorkspaceDTO | 

try {
    final response = api.updateWorkspace(id, workspaceDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceControllerApi->updateWorkspace: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **workspaceDTO** | [**WorkspaceDTO**](WorkspaceDTO.md)|  | 

### Return type

[**WorkspaceDTO**](WorkspaceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

