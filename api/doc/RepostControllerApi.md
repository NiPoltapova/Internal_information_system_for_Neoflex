# openapi.api.RepostControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRepost**](RepostControllerApi.md#createrepost) | **POST** /api/reposts | 
[**deleteRepost**](RepostControllerApi.md#deleterepost) | **DELETE** /api/reposts/{id} | 
[**getAllReposts**](RepostControllerApi.md#getallreposts) | **GET** /api/reposts | 
[**getRepostById**](RepostControllerApi.md#getrepostbyid) | **GET** /api/reposts/{id} | 


# **createRepost**
> RepostDTO createRepost(repostDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRepostControllerApi();
final RepostDTO repostDTO = ; // RepostDTO | 

try {
    final response = api.createRepost(repostDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RepostControllerApi->createRepost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **repostDTO** | [**RepostDTO**](RepostDTO.md)|  | 

### Return type

[**RepostDTO**](RepostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRepost**
> deleteRepost(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRepostControllerApi();
final int id = 789; // int | 

try {
    api.deleteRepost(id);
} catch on DioException (e) {
    print('Exception when calling RepostControllerApi->deleteRepost: $e\n');
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

# **getAllReposts**
> BuiltList<RepostDTO> getAllReposts()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRepostControllerApi();

try {
    final response = api.getAllReposts();
    print(response);
} catch on DioException (e) {
    print('Exception when calling RepostControllerApi->getAllReposts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;RepostDTO&gt;**](RepostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRepostById**
> RepostDTO getRepostById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRepostControllerApi();
final int id = 789; // int | 

try {
    final response = api.getRepostById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RepostControllerApi->getRepostById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**RepostDTO**](RepostDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

