# openapi.api.MessageControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMessage**](MessageControllerApi.md#createmessage) | **POST** /api/chats/{chatId}/messages | 
[**deleteMessage**](MessageControllerApi.md#deletemessage) | **DELETE** /api/chats/{chatId}/messages/{messageId} | 
[**getChatMessages**](MessageControllerApi.md#getchatmessages) | **GET** /api/chats/{chatId}/messages | 
[**getMessage**](MessageControllerApi.md#getmessage) | **GET** /api/chats/{chatId}/messages/{messageId} | 
[**updateMessage**](MessageControllerApi.md#updatemessage) | **PUT** /api/chats/{chatId}/messages/{messageId} | 


# **createMessage**
> MessageDTO createMessage(chatId, messageCreateRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int chatId = 789; // int | 
final MessageCreateRequest messageCreateRequest = ; // MessageCreateRequest | 

try {
    final response = api.createMessage(chatId, messageCreateRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->createMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **int**|  | 
 **messageCreateRequest** | [**MessageCreateRequest**](MessageCreateRequest.md)|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMessage**
> deleteMessage(chatId, messageId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int chatId = 789; // int | 
final int messageId = 789; // int | 

try {
    api.deleteMessage(chatId, messageId);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->deleteMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **int**|  | 
 **messageId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChatMessages**
> PageMessageDTO getChatMessages(chatId, page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int chatId = 789; // int | 
final int page = 56; // int | 
final int size = 56; // int | 
final BuiltList<String> sort = ; // BuiltList<String> | 

try {
    final response = api.getChatMessages(chatId, page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->getChatMessages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **int**|  | 
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] [default to ListBuilder()]

### Return type

[**PageMessageDTO**](PageMessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMessage**
> MessageDTO getMessage(chatId, messageId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int chatId = 789; // int | 
final int messageId = 789; // int | 

try {
    final response = api.getMessage(chatId, messageId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->getMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **int**|  | 
 **messageId** | **int**|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMessage**
> MessageDTO updateMessage(chatId, messageId, updateRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int chatId = 789; // int | 
final int messageId = 789; // int | 
final MessageUpdateRequest updateRequest = ; // MessageUpdateRequest | 

try {
    final response = api.updateMessage(chatId, messageId, updateRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->updateMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **int**|  | 
 **messageId** | **int**|  | 
 **updateRequest** | [**MessageUpdateRequest**](.md)|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

