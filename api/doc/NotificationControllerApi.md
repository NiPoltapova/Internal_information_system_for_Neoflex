# openapi.api.NotificationControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getNotifications**](NotificationControllerApi.md#getnotifications) | **GET** /api/notifications | 
[**markAsRead**](NotificationControllerApi.md#markasread) | **PATCH** /api/notifications/{id}/read | 


# **getNotifications**
> BuiltList<MessageNotificationDTO> getNotifications(limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getNotificationControllerApi();
final int limit = 56; // int | 

try {
    final response = api.getNotifications(limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NotificationControllerApi->getNotifications: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**BuiltList&lt;MessageNotificationDTO&gt;**](MessageNotificationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markAsRead**
> markAsRead(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getNotificationControllerApi();
final int id = 789; // int | 

try {
    api.markAsRead(id);
} catch on DioException (e) {
    print('Exception when calling NotificationControllerApi->markAsRead: $e\n');
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

