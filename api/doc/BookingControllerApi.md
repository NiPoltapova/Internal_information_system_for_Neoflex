# openapi.api.BookingControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkAvailability**](BookingControllerApi.md#checkavailability) | **GET** /api/bookings/availability/{workspaceId} | 
[**createBooking**](BookingControllerApi.md#createbooking) | **POST** /api/bookings | 
[**deleteBooking**](BookingControllerApi.md#deletebooking) | **DELETE** /api/bookings/{id} | 
[**getAllBookings**](BookingControllerApi.md#getallbookings) | **GET** /api/bookings | 
[**getBookingById**](BookingControllerApi.md#getbookingbyid) | **GET** /api/bookings/{id} | 


# **checkAvailability**
> BuiltList<DateTime> checkAvailability(workspaceId, date)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBookingControllerApi();
final int workspaceId = 789; // int | 
final DateTime date = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.checkAvailability(workspaceId, date);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BookingControllerApi->checkAvailability: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **int**|  | 
 **date** | **DateTime**|  | 

### Return type

[**BuiltList&lt;DateTime&gt;**](DateTime.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createBooking**
> BookingDTO createBooking(bookingDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBookingControllerApi();
final BookingDTO bookingDTO = ; // BookingDTO | 

try {
    final response = api.createBooking(bookingDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BookingControllerApi->createBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookingDTO** | [**BookingDTO**](BookingDTO.md)|  | 

### Return type

[**BookingDTO**](BookingDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteBooking**
> deleteBooking(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBookingControllerApi();
final int id = 789; // int | 

try {
    api.deleteBooking(id);
} catch on DioException (e) {
    print('Exception when calling BookingControllerApi->deleteBooking: $e\n');
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

# **getAllBookings**
> PageBookingDTO getAllBookings(pageable)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBookingControllerApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getAllBookings(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BookingControllerApi->getAllBookings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](.md)|  | 

### Return type

[**PageBookingDTO**](PageBookingDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBookingById**
> BookingDTO getBookingById(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBookingControllerApi();
final int id = 789; // int | 

try {
    final response = api.getBookingById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BookingControllerApi->getBookingById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**BookingDTO**](BookingDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

