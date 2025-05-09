# openapi.api.UserControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminCreateUser**](UserControllerApi.md#admincreateuser) | **POST** /api/users | 
[**adminDeleteUser**](UserControllerApi.md#admindeleteuser) | **DELETE** /api/users/{id} | 
[**getAllUsers**](UserControllerApi.md#getallusers) | **GET** /api/users | 
[**getCurrentUser**](UserControllerApi.md#getcurrentuser) | **GET** /api/users/me | 
[**getUserById**](UserControllerApi.md#getuserbyid) | **GET** /api/users/{id} | 
[**searchByFIO**](UserControllerApi.md#searchbyfio) | **GET** /api/users/search | 
[**updateCurrentUser**](UserControllerApi.md#updatecurrentuser) | **PUT** /api/users/me | 
[**uploadAvatar**](UserControllerApi.md#uploadavatar) | **POST** /api/users/me/avatar | 


# **adminCreateUser**
> UserDTO adminCreateUser(userCreateRequestDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final UserCreateRequestDTO userCreateRequestDTO = ; // UserCreateRequestDTO | 

try {
    final response = api.adminCreateUser(userCreateRequestDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->adminCreateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCreateRequestDTO** | [**UserCreateRequestDTO**](UserCreateRequestDTO.md)|  | 

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminDeleteUser**
> adminDeleteUser(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final int id = 789; // int | 

try {
    api.adminDeleteUser(id);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->adminDeleteUser: $e\n');
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

# **getAllUsers**
> BuiltList<UserDTO> getAllUsers()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();

try {
    final response = api.getAllUsers();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->getAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserDTO&gt;**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUser**
> UserDTO getCurrentUser()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();

try {
    final response = api.getCurrentUser();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->getCurrentUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserById**
> UserDTO getUserById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final int id = 789; // int | 

try {
    final response = api.getUserById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->getUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchByFIO**
> PageUserDTO searchByFIO(query, page, size)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final String query = query_example; // String | 
final int page = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.searchByFIO(query, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->searchByFIO: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | 
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**PageUserDTO**](PageUserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCurrentUser**
> UserDTO updateCurrentUser(userDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final UserDTO userDTO = ; // UserDTO | 

try {
    final response = api.updateCurrentUser(userDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->updateCurrentUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDTO** | [**UserDTO**](UserDTO.md)|  | 

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadAvatar**
> String uploadAvatar(uploadAvatarRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserControllerApi();
final UploadAvatarRequest uploadAvatarRequest = ; // UploadAvatarRequest | 

try {
    final response = api.uploadAvatar(uploadAvatarRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->uploadAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uploadAvatarRequest** | [**UploadAvatarRequest**](UploadAvatarRequest.md)|  | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

