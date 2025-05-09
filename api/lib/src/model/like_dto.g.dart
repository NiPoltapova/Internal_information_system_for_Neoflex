// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LikeDTO extends LikeDTO {
  @override
  final int? postId;
  @override
  final int? userId;

  factory _$LikeDTO([void Function(LikeDTOBuilder)? updates]) =>
      (new LikeDTOBuilder()..update(updates))._build();

  _$LikeDTO._({this.postId, this.userId}) : super._();

  @override
  LikeDTO rebuild(void Function(LikeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LikeDTOBuilder toBuilder() => new LikeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LikeDTO && postId == other.postId && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LikeDTO')
          ..add('postId', postId)
          ..add('userId', userId))
        .toString();
  }
}

class LikeDTOBuilder implements Builder<LikeDTO, LikeDTOBuilder> {
  _$LikeDTO? _$v;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  LikeDTOBuilder() {
    LikeDTO._defaults(this);
  }

  LikeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postId = $v.postId;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LikeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LikeDTO;
  }

  @override
  void update(void Function(LikeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LikeDTO build() => _build();

  _$LikeDTO _build() {
    final _$result = _$v ??
        new _$LikeDTO._(
          postId: postId,
          userId: userId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
