// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostResponseDTO extends PostResponseDTO {
  @override
  final int? id;
  @override
  final DateTime? createdWhen;
  @override
  final String? text;
  @override
  final BuiltList<MediaDTO>? media;
  @override
  final int? userId;
  @override
  final int? likeCount;
  @override
  final int? commentCount;
  @override
  final int? repostCount;
  @override
  final bool? liked;

  factory _$PostResponseDTO([void Function(PostResponseDTOBuilder)? updates]) =>
      (new PostResponseDTOBuilder()..update(updates))._build();

  _$PostResponseDTO._(
      {this.id,
      this.createdWhen,
      this.text,
      this.media,
      this.userId,
      this.likeCount,
      this.commentCount,
      this.repostCount,
      this.liked})
      : super._();

  @override
  PostResponseDTO rebuild(void Function(PostResponseDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostResponseDTOBuilder toBuilder() =>
      new PostResponseDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostResponseDTO &&
        id == other.id &&
        createdWhen == other.createdWhen &&
        text == other.text &&
        media == other.media &&
        userId == other.userId &&
        likeCount == other.likeCount &&
        commentCount == other.commentCount &&
        repostCount == other.repostCount &&
        liked == other.liked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, commentCount.hashCode);
    _$hash = $jc(_$hash, repostCount.hashCode);
    _$hash = $jc(_$hash, liked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostResponseDTO')
          ..add('id', id)
          ..add('createdWhen', createdWhen)
          ..add('text', text)
          ..add('media', media)
          ..add('userId', userId)
          ..add('likeCount', likeCount)
          ..add('commentCount', commentCount)
          ..add('repostCount', repostCount)
          ..add('liked', liked))
        .toString();
  }
}

class PostResponseDTOBuilder
    implements Builder<PostResponseDTO, PostResponseDTOBuilder> {
  _$PostResponseDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdWhen;
  DateTime? get createdWhen => _$this._createdWhen;
  set createdWhen(DateTime? createdWhen) => _$this._createdWhen = createdWhen;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<MediaDTO>? _media;
  ListBuilder<MediaDTO> get media =>
      _$this._media ??= new ListBuilder<MediaDTO>();
  set media(ListBuilder<MediaDTO>? media) => _$this._media = media;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _likeCount;
  int? get likeCount => _$this._likeCount;
  set likeCount(int? likeCount) => _$this._likeCount = likeCount;

  int? _commentCount;
  int? get commentCount => _$this._commentCount;
  set commentCount(int? commentCount) => _$this._commentCount = commentCount;

  int? _repostCount;
  int? get repostCount => _$this._repostCount;
  set repostCount(int? repostCount) => _$this._repostCount = repostCount;

  bool? _liked;
  bool? get liked => _$this._liked;
  set liked(bool? liked) => _$this._liked = liked;

  PostResponseDTOBuilder() {
    PostResponseDTO._defaults(this);
  }

  PostResponseDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdWhen = $v.createdWhen;
      _text = $v.text;
      _media = $v.media?.toBuilder();
      _userId = $v.userId;
      _likeCount = $v.likeCount;
      _commentCount = $v.commentCount;
      _repostCount = $v.repostCount;
      _liked = $v.liked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostResponseDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostResponseDTO;
  }

  @override
  void update(void Function(PostResponseDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostResponseDTO build() => _build();

  _$PostResponseDTO _build() {
    _$PostResponseDTO _$result;
    try {
      _$result = _$v ??
          new _$PostResponseDTO._(
            id: id,
            createdWhen: createdWhen,
            text: text,
            media: _media?.build(),
            userId: userId,
            likeCount: likeCount,
            commentCount: commentCount,
            repostCount: repostCount,
            liked: liked,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostResponseDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
