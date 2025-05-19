// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostDTO extends PostDTO {
  @override
  final int? id;
  @override
  final DateTime createdWhen;
  @override
  final String? text;
  @override
  final BuiltList<MediaDTO>? media;
  @override
  final int? userId;

  factory _$PostDTO([void Function(PostDTOBuilder)? updates]) =>
      (new PostDTOBuilder()..update(updates))._build();

  _$PostDTO._(
      {this.id, required this.createdWhen, this.text, this.media, this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        createdWhen, r'PostDTO', 'createdWhen');
  }

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
        text == other.text &&
        media == other.media &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostDTO')
          ..add('id', id)
          ..add('createdWhen', createdWhen)
          ..add('text', text)
          ..add('media', media)
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

  PostDTOBuilder() {
    PostDTO._defaults(this);
  }

  PostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdWhen = $v.createdWhen;
      _text = $v.text;
      _media = $v.media?.toBuilder();
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
            createdWhen: BuiltValueNullFieldError.checkNotNull(
                createdWhen, r'PostDTO', 'createdWhen'),
            text: text,
            media: _media?.build(),
            userId: userId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        _media?.build();
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
