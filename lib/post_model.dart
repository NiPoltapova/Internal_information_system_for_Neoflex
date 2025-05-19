import 'package:openapi/openapi.dart';

class Post {
  int? id;
  DateTime createdWhen;
  String text;
  List<String> imageUrls;
  int userId;
  List<String> comments;
  bool isLiked;
  int likesCount;
  int views;

  Post({
    this.id,
    required this.createdWhen,
    required this.text,
    required this.imageUrls,
    required this.userId,
    this.comments = const [],
    this.isLiked = false,
    this.likesCount = 0,
    this.views = 0,
  });

  factory Post.fromDto(PostDTO dto) {
    return Post(
      id: dto.id,
      createdWhen: dto.createdWhen ?? DateTime.now(),
      text: dto.text ?? '',
      imageUrls: dto.media
              ?.map((m) => m.downloadUrl ?? '')
              .where((url) => url.isNotEmpty)
              .toList() ??
          [],
      userId: dto.userId ?? 0,
    );
  }
  // factory Post.fromResponseDto(PostResponseDTO dto) {
  //   return Post(
  //     id: dto.id,
  //     createdWhen: dto.createdWhen ?? DateTime.now(),
  //     text: dto.text ?? '',
  //     imageUrls: dto.media
  //             ?.where((m) =>
  //                 m.mediaType == MediaDTOMediaTypeEnum.IMAGE &&
  //                 (m.downloadUrl?.isNotEmpty ?? false))
  //             .map((m) => m.downloadUrl!)
  //             .toList() ??
  //         [],
  //     userId: dto.userId ?? 0,
  //   );
  // }
}
