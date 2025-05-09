# openapi.api.MessageControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMessage**](MessageControllerApi.md#createmessage) | **POST** /api/messages | 
[**deleteMessage**](MessageControllerApi.md#deletemessage) | **DELETE** /api/messages/{id} | 
[**getAllMessages**](MessageControllerApi.md#getallmessages) | **GET** /api/messages | 
[**getMessageById**](MessageControllerApi.md#getmessagebyid) | **GET** /api/messages/{id} | 
[**updateMessage**](MessageControllerApi.md#updatemessage) | **PUT** /api/messages/{id} | 


# **createMessage**
> MessageDTO createMessage(text, files, chatId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final String text = text_example; // String | 
final BuiltList<Uint8List> files = ; // BuiltList<Uint8List> | 
final int chatId = 789; // int | 

try {
    final response = api.createMessage(text, files, chatId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->createMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **text** | **String**|  | 
 **files** | [**BuiltList&lt;Uint8List&gt;**](Uint8List.md)|  | 
 **chatId** | **int**|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMessage**
> deleteMessage(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int id = 789; // int | 

try {
    api.deleteMessage(id);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->deleteMessage: $e\n');
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

# **getAllMessages**
> BuiltList<MessageDTO> getAllMessages()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();

try {
    final response = api.getAllMessages();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->getAllMessages: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;MessageDTO&gt;**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMessageById**
> MessageDTO getMessageById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int id = 789; // int | 

try {
    final response = api.getMessageById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->getMessageById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMessage**
> MessageDTO updateMessage(id, newText, newFiles)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMessageControllerApi();
final int id = 789; // int | 
final String newText = newText_example; // String | 
final BuiltList<Uint8List> newFiles = ; // BuiltList<Uint8List> | 

try {
    final response = api.updateMessage(id, newText, newFiles);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MessageControllerApi->updateMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **newText** | **String**|  | 
 **newFiles** | [**BuiltList&lt;Uint8List&gt;**](Uint8List.md)|  | 

### Return type

[**MessageDTO**](MessageDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

