# openapi.api.PostControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPost**](PostControllerApi.md#createpost) | **POST** /api/posts | 
[**deletePost**](PostControllerApi.md#deletepost) | **DELETE** /api/posts/{id} | 
[**getAllPosts**](PostControllerApi.md#getallposts) | **GET** /api/posts | 
[**getPostById**](PostControllerApi.md#getpostbyid) | **GET** /api/posts/{id} | 
[**updatePost**](PostControllerApi.md#updatepost) | **PUT** /api/posts/{id} | 


# **createPost**
> PostDTO createPost(title, text, files)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostControllerApi();
final String title = title_example; // String | 
final String text = text_example; // String | 
final BuiltList<MultipartFile> files = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.createPost(title, text, files);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostControllerApi->createPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **title** | **String**|  | 
 **text** | **String**|  | 
 **files** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | 

### Return type

[**PostDTO**](PostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePost**
> deletePost(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostControllerApi();
final int id = 789; // int | 

try {
    api.deletePost(id);
} catch on DioException (e) {
    print('Exception when calling PostControllerApi->deletePost: $e\n');
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

# **getAllPosts**
> BuiltList<PostDTO> getAllPosts()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostControllerApi();

try {
    final response = api.getAllPosts();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostControllerApi->getAllPosts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PostDTO&gt;**](PostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostById**
> PostDTO getPostById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostControllerApi();
final int id = 789; // int | 

try {
    final response = api.getPostById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostControllerApi->getPostById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PostDTO**](PostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePost**
> PostDTO updatePost(id, postDTO, files)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostControllerApi();
final int id = 789; // int | 
final PostDTO postDTO = ; // PostDTO | 
final BuiltList<MultipartFile> files = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.updatePost(id, postDTO, files);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostControllerApi->updatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **postDTO** | [**PostDTO**](PostDTO.md)|  | [optional] 
 **files** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | [optional] 

### Return type

[**PostDTO**](PostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

