import 'package:openapi/openapi.dart';

class Post {
  int? id;
  DateTime createdWhen;
  String? title;
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
    this.title,
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
      title: dto.title,
      text: dto.text ?? '',
      imageUrls: dto.mediaUrls
              ?.map((m) => m.downloadUrl ?? '')
              .where((url) => url.isNotEmpty)
              .toList() ??
          [],
      userId: dto.userId ?? 0,
    );
  }
}
