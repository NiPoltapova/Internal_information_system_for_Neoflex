# openapi.api.LikeControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLike**](LikeControllerApi.md#createlike) | **POST** /api/posts/{postId}/likes | 
[**deleteLike**](LikeControllerApi.md#deletelike) | **DELETE** /api/posts/{postId}/likes/{userId} | 
[**getLikesByPost**](LikeControllerApi.md#getlikesbypost) | **GET** /api/posts/{postId}/likes | 
[**getLikesCount**](LikeControllerApi.md#getlikescount) | **GET** /api/posts/{postId}/likes/count | 


# **createLike**
> LikeDTO createLike(postId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLikeControllerApi();
final int postId = 789; // int | 

try {
    final response = api.createLike(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LikeControllerApi->createLike: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**LikeDTO**](LikeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteLike**
> deleteLike(postId, userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLikeControllerApi();
final int postId = 789; // int | 
final int userId = 789; // int | 

try {
    api.deleteLike(postId, userId);
} catch on DioException (e) {
    print('Exception when calling LikeControllerApi->deleteLike: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **userId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLikesByPost**
> PageLikeDTO getLikesByPost(postId, pageable)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLikeControllerApi();
final int postId = 789; // int | 
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getLikesByPost(postId, pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LikeControllerApi->getLikesByPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **pageable** | [**Pageable**](.md)|  | 

### Return type

[**PageLikeDTO**](PageLikeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLikesCount**
> int getLikesCount(postId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLikeControllerApi();
final int postId = 789; // int | 

try {
    final response = api.getLikesCount(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LikeControllerApi->getLikesCount: $e\n');
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

