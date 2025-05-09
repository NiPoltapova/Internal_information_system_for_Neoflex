# openapi.api.CommentControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createComment**](CommentControllerApi.md#createcomment) | **POST** /api/posts/{postId}/comments | 
[**deleteComment**](CommentControllerApi.md#deletecomment) | **DELETE** /api/posts/{postId}/comments/{commentId} | 
[**getComment**](CommentControllerApi.md#getcomment) | **GET** /api/posts/{postId}/comments/{commentId} | 
[**getCommentCount**](CommentControllerApi.md#getcommentcount) | **GET** /api/posts/{postId}/comments/count | 
[**getComments**](CommentControllerApi.md#getcomments) | **GET** /api/posts/{postId}/comments | 
[**updateComment**](CommentControllerApi.md#updatecomment) | **PUT** /api/posts/{postId}/comments/{commentId} | 


# **createComment**
> CommentDTO createComment(postId, commentDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 
final CommentDTO commentDTO = ; // CommentDTO | 

try {
    final response = api.createComment(postId, commentDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->createComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **commentDTO** | [**CommentDTO**](CommentDTO.md)|  | 

### Return type

[**CommentDTO**](CommentDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteComment**
> deleteComment(postId, commentId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 
final int commentId = 789; // int | 

try {
    api.deleteComment(postId, commentId);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->deleteComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **commentId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getComment**
> CommentDTO getComment(postId, commentId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 
final int commentId = 789; // int | 

try {
    final response = api.getComment(postId, commentId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->getComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **commentId** | **int**|  | 

### Return type

[**CommentDTO**](CommentDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommentCount**
> int getCommentCount(postId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 

try {
    final response = api.getCommentCount(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->getCommentCount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getComments**
> BuiltList<CommentDTO> getComments(postId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 

try {
    final response = api.getComments(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->getComments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**BuiltList&lt;CommentDTO&gt;**](CommentDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateComment**
> CommentDTO updateComment(postId, commentId, commentDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCommentControllerApi();
final int postId = 789; // int | 
final int commentId = 789; // int | 
final CommentDTO commentDTO = ; // CommentDTO | 

try {
    final response = api.updateComment(postId, commentId, commentDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CommentControllerApi->updateComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **commentId** | **int**|  | 
 **commentDTO** | [**CommentDTO**](CommentDTO.md)|  | 

### Return type

[**CommentDTO**](CommentDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

