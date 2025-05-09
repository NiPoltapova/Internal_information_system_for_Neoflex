# openapi.api.MediaControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadMedia**](MediaControllerApi.md#downloadmedia) | **GET** /api/media/{filename} | 


# **downloadMedia**
> Uint8List downloadMedia(filename)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaControllerApi();
final String filename = filename_example; // String | 

try {
    final response = api.downloadMedia(filename);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaControllerApi->downloadMedia: $e\n');
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

