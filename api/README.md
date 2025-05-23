# openapi (EXPERIMENTAL)
Documentation for API endpoints

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0
- Generator version: 7.12.0
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  openapi: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  openapi:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  openapi:
    path: /path/to/openapi
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/openapi.dart';


final api = Openapi().getBookingControllerApi();
final int workspaceId = 789; // int | 
final DateTime date = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = await api.checkAvailability(workspaceId, date);
    print(response);
} catch on DioException (e) {
    print("Exception when calling BookingControllerApi->checkAvailability: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost:8080*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*BookingControllerApi*](doc/BookingControllerApi.md) | [**checkAvailability**](doc/BookingControllerApi.md#checkavailability) | **GET** /api/bookings/availability/{workspaceId} | 
[*BookingControllerApi*](doc/BookingControllerApi.md) | [**createBooking**](doc/BookingControllerApi.md#createbooking) | **POST** /api/bookings | 
[*BookingControllerApi*](doc/BookingControllerApi.md) | [**deleteBooking**](doc/BookingControllerApi.md#deletebooking) | **DELETE** /api/bookings/{id} | 
[*BookingControllerApi*](doc/BookingControllerApi.md) | [**getAllBookings**](doc/BookingControllerApi.md#getallbookings) | **GET** /api/bookings | 
[*BookingControllerApi*](doc/BookingControllerApi.md) | [**getBookingById**](doc/BookingControllerApi.md#getbookingbyid) | **GET** /api/bookings/{id} | 
[*ChatControllerApi*](doc/ChatControllerApi.md) | [**createChat**](doc/ChatControllerApi.md#createchat) | **POST** /api/chats | 
[*ChatControllerApi*](doc/ChatControllerApi.md) | [**deleteChat**](doc/ChatControllerApi.md#deletechat) | **DELETE** /api/chats/{id} | 
[*ChatControllerApi*](doc/ChatControllerApi.md) | [**getChatById**](doc/ChatControllerApi.md#getchatbyid) | **GET** /api/chats/{id} | 
[*ChatControllerApi*](doc/ChatControllerApi.md) | [**getMyChats**](doc/ChatControllerApi.md#getmychats) | **GET** /api/chats/my | 
[*ChatControllerApi*](doc/ChatControllerApi.md) | [**updateChat**](doc/ChatControllerApi.md#updatechat) | **PUT** /api/chats/{id} | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**createComment**](doc/CommentControllerApi.md#createcomment) | **POST** /api/posts/{postId}/comments | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**deleteComment**](doc/CommentControllerApi.md#deletecomment) | **DELETE** /api/posts/{postId}/comments/{commentId} | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**getComment**](doc/CommentControllerApi.md#getcomment) | **GET** /api/posts/{postId}/comments/{commentId} | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**getCommentCount**](doc/CommentControllerApi.md#getcommentcount) | **GET** /api/posts/{postId}/comments/count | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**getComments**](doc/CommentControllerApi.md#getcomments) | **GET** /api/posts/{postId}/comments | 
[*CommentControllerApi*](doc/CommentControllerApi.md) | [**updateComment**](doc/CommentControllerApi.md#updatecomment) | **PUT** /api/posts/{postId}/comments/{commentId} | 
[*FileControllerApi*](doc/FileControllerApi.md) | [**downloadFile**](doc/FileControllerApi.md#downloadfile) | **GET** /api/files/{filename} | 
[*LikeControllerApi*](doc/LikeControllerApi.md) | [**createLike**](doc/LikeControllerApi.md#createlike) | **POST** /api/posts/{postId}/likes | 
[*LikeControllerApi*](doc/LikeControllerApi.md) | [**deleteLike**](doc/LikeControllerApi.md#deletelike) | **DELETE** /api/posts/{postId}/likes/{userId} | 
[*LikeControllerApi*](doc/LikeControllerApi.md) | [**getLikesByPost**](doc/LikeControllerApi.md#getlikesbypost) | **GET** /api/posts/{postId}/likes | 
[*LikeControllerApi*](doc/LikeControllerApi.md) | [**getLikesCount**](doc/LikeControllerApi.md#getlikescount) | **GET** /api/posts/{postId}/likes/count | 
[*MediaControllerApi*](doc/MediaControllerApi.md) | [**downloadMedia**](doc/MediaControllerApi.md#downloadmedia) | **GET** /api/media/{filename} | 
[*MessageControllerApi*](doc/MessageControllerApi.md) | [**createMessage**](doc/MessageControllerApi.md#createmessage) | **POST** /api/chats/{chatId}/messages | 
[*MessageControllerApi*](doc/MessageControllerApi.md) | [**deleteMessage**](doc/MessageControllerApi.md#deletemessage) | **DELETE** /api/chats/{chatId}/messages/{messageId} | 
[*MessageControllerApi*](doc/MessageControllerApi.md) | [**getChatMessages**](doc/MessageControllerApi.md#getchatmessages) | **GET** /api/chats/{chatId}/messages | 
[*MessageControllerApi*](doc/MessageControllerApi.md) | [**getMessage**](doc/MessageControllerApi.md#getmessage) | **GET** /api/chats/{chatId}/messages/{messageId} | 
[*MessageControllerApi*](doc/MessageControllerApi.md) | [**updateMessage**](doc/MessageControllerApi.md#updatemessage) | **PUT** /api/chats/{chatId}/messages/{messageId} | 
[*NotificationControllerApi*](doc/NotificationControllerApi.md) | [**getNotifications**](doc/NotificationControllerApi.md#getnotifications) | **GET** /api/notifications | 
[*NotificationControllerApi*](doc/NotificationControllerApi.md) | [**markAsRead**](doc/NotificationControllerApi.md#markasread) | **PATCH** /api/notifications/{id}/read | 
[*PostControllerApi*](doc/PostControllerApi.md) | [**createPost**](doc/PostControllerApi.md#createpost) | **POST** /api/posts | 
[*PostControllerApi*](doc/PostControllerApi.md) | [**deletePost**](doc/PostControllerApi.md#deletepost) | **DELETE** /api/posts/{id} | 
[*PostControllerApi*](doc/PostControllerApi.md) | [**getAllPosts**](doc/PostControllerApi.md#getallposts) | **GET** /api/posts | 
[*PostControllerApi*](doc/PostControllerApi.md) | [**getPostById**](doc/PostControllerApi.md#getpostbyid) | **GET** /api/posts/{id} | 
[*PostControllerApi*](doc/PostControllerApi.md) | [**updatePost**](doc/PostControllerApi.md#updatepost) | **PUT** /api/posts/{id} | 
[*RepostControllerApi*](doc/RepostControllerApi.md) | [**createRepost**](doc/RepostControllerApi.md#createrepost) | **POST** /api/reposts | 
[*RepostControllerApi*](doc/RepostControllerApi.md) | [**deleteRepost**](doc/RepostControllerApi.md#deleterepost) | **DELETE** /api/reposts/{id} | 
[*RepostControllerApi*](doc/RepostControllerApi.md) | [**getAllReposts**](doc/RepostControllerApi.md#getallreposts) | **GET** /api/reposts | 
[*RepostControllerApi*](doc/RepostControllerApi.md) | [**getRepostById**](doc/RepostControllerApi.md#getrepostbyid) | **GET** /api/reposts/{id} | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminCreateUser**](doc/UserControllerApi.md#admincreateuser) | **POST** /api/users | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminDeleteUser**](doc/UserControllerApi.md#admindeleteuser) | **DELETE** /api/users/{id} | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminGetAllUsers**](doc/UserControllerApi.md#admingetallusers) | **GET** /api/users/full | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminGetUser**](doc/UserControllerApi.md#admingetuser) | **GET** /api/users/{id}/full | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminUpdateUser**](doc/UserControllerApi.md#adminupdateuser) | **PUT** /api/users/{id} | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**adminUploadAvatar**](doc/UserControllerApi.md#adminuploadavatar) | **POST** /api/users/{id}/avatar | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**getAllUsers**](doc/UserControllerApi.md#getallusers) | **GET** /api/users | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**getCurrentUser**](doc/UserControllerApi.md#getcurrentuser) | **GET** /api/users/me | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**getUserById**](doc/UserControllerApi.md#getuserbyid) | **GET** /api/users/{id} | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**searchByFIO**](doc/UserControllerApi.md#searchbyfio) | **GET** /api/users/search | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**updateCurrentUser**](doc/UserControllerApi.md#updatecurrentuser) | **PUT** /api/users/me | 
[*UserControllerApi*](doc/UserControllerApi.md) | [**uploadAvatar**](doc/UserControllerApi.md#uploadavatar) | **POST** /api/users/me/avatar | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**createWorkspace**](doc/WorkspaceControllerApi.md#createworkspace) | **POST** /api/workspaces | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**deleteWorkspace**](doc/WorkspaceControllerApi.md#deleteworkspace) | **DELETE** /api/workspaces/{id} | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**getAllWorkspaces**](doc/WorkspaceControllerApi.md#getallworkspaces) | **GET** /api/workspaces | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**getAvailableWorkspaces**](doc/WorkspaceControllerApi.md#getavailableworkspaces) | **GET** /api/workspaces/available | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**getWorkspaceById**](doc/WorkspaceControllerApi.md#getworkspacebyid) | **GET** /api/workspaces/{id} | 
[*WorkspaceControllerApi*](doc/WorkspaceControllerApi.md) | [**updateWorkspace**](doc/WorkspaceControllerApi.md#updateworkspace) | **PUT** /api/workspaces/{id} | 


## Documentation For Models

 - [BookingDTO](doc/BookingDTO.md)
 - [ChatDTO](doc/ChatDTO.md)
 - [ChatSummaryDTO](doc/ChatSummaryDTO.md)
 - [CommentDTO](doc/CommentDTO.md)
 - [FileDTO](doc/FileDTO.md)
 - [LikeDTO](doc/LikeDTO.md)
 - [MediaDTO](doc/MediaDTO.md)
 - [MessageCreateRequest](doc/MessageCreateRequest.md)
 - [MessageDTO](doc/MessageDTO.md)
 - [MessageNotificationDTO](doc/MessageNotificationDTO.md)
 - [MessageUpdateRequest](doc/MessageUpdateRequest.md)
 - [PageBookingDTO](doc/PageBookingDTO.md)
 - [PageChatSummaryDTO](doc/PageChatSummaryDTO.md)
 - [PageLikeDTO](doc/PageLikeDTO.md)
 - [PageMessageDTO](doc/PageMessageDTO.md)
 - [PagePostResponseDTO](doc/PagePostResponseDTO.md)
 - [PageUserDTO](doc/PageUserDTO.md)
 - [Pageable](doc/Pageable.md)
 - [PageableObject](doc/PageableObject.md)
 - [PostDTO](doc/PostDTO.md)
 - [PostResponseDTO](doc/PostResponseDTO.md)
 - [RepostDTO](doc/RepostDTO.md)
 - [SortObject](doc/SortObject.md)
 - [UserDTO](doc/UserDTO.md)
 - [UserExtendedDTO](doc/UserExtendedDTO.md)
 - [WorkspaceDTO](doc/WorkspaceDTO.md)


## Documentation For Authorization

Endpoints do not require authorization.


## Author



