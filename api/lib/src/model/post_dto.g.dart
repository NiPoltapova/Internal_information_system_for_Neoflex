// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostDTO extends PostDTO {
  @override
  final int? id;
  @override
  final DateTime? createdWhen;
  @override
  final String? title;
  @override
  final String? text;
  @override
  final BuiltList<MediaDTO>? mediaUrls;
  @override
  final int? userId;

  factory _$PostDTO([void Function(PostDTOBuilder)? updates]) =>
      (new PostDTOBuilder()..update(updates))._build();

  _$PostDTO._(
      {this.id,
      this.createdWhen,
      this.title,
      this.text,
      this.mediaUrls,
      this.userId})
      : super._();

  @override
  PostDTO rebuild(void Function(PostDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostDTOBuilder toBuilder() => new PostDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostDTO &&
        id == other.id &&
        createdWhen == other.createdWhen &&
        title == other.title &&
        text == other.text &&
        mediaUrls == other.mediaUrls &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, mediaUrls.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostDTO')
          ..add('id', id)
          ..add('createdWhen', createdWhen)
          ..add('title', title)
          ..add('text', text)
          ..add('mediaUrls', mediaUrls)
          ..add('userId', userId))
        .toString();
  }
}

class PostDTOBuilder implements Builder<PostDTO, PostDTOBuilder> {
  _$PostDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdWhen;
  DateTime? get createdWhen => _$this._createdWhen;
  set createdWhen(DateTime? createdWhen) => _$this._createdWhen = createdWhen;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<MediaDTO>? _mediaUrls;
  ListBuilder<MediaDTO> get mediaUrls =>
      _$this._mediaUrls ??= new ListBuilder<MediaDTO>();
  set mediaUrls(ListBuilder<MediaDTO>? mediaUrls) =>
      _$this._mediaUrls = mediaUrls;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  PostDTOBuilder() {
    PostDTO._defaults(this);
  }

  PostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdWhen = $v.createdWhen;
      _title = $v.title;
      _text = $v.text;
      _mediaUrls = $v.mediaUrls?.toBuilder();
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostDTO;
  }

  @override
  void update(void Function(PostDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostDTO build() => _build();

  _$PostDTO _build() {
    _$PostDTO _$result;
    try {
      _$result = _$v ??
          new _$PostDTO._(
            id: id,
            createdWhen: createdWhen,
            title: title,
            text: text,
            mediaUrls: _mediaUrls?.build(),
            userId: userId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mediaUrls';
        _mediaUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
