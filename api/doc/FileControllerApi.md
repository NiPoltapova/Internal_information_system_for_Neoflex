# openapi.api.FileControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadFile**](FileControllerApi.md#downloadfile) | **GET** /api/files/{filename} | 


# **downloadFile**
> Uint8List downloadFile(filename)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFileControllerApi();
final String filename = filename_example; // String | 

try {
    final response = api.downloadFile(filename);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FileControllerApi->downloadFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filename** | **String**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

