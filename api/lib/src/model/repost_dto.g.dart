// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repost_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RepostDTO extends RepostDTO {
  @override
  final int? id;
  @override
  final int? postId;
  @override
  final int? userId;
  @override
  final int? targetChatId;

  factory _$RepostDTO([void Function(RepostDTOBuilder)? updates]) =>
      (new RepostDTOBuilder()..update(updates))._build();

  _$RepostDTO._({this.id, this.postId, this.userId, this.targetChatId})
      : super._();

  @override
  RepostDTO rebuild(void Function(RepostDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepostDTOBuilder toBuilder() => new RepostDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepostDTO &&
        id == other.id &&
        postId == other.postId &&
        userId == other.userId &&
        targetChatId == other.targetChatId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, targetChatId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RepostDTO')
          ..add('id', id)
          ..add('postId', postId)
          ..add('userId', userId)
          ..add('targetChatId', targetChatId))
        .toString();
  }
}

class RepostDTOBuilder implements Builder<RepostDTO, RepostDTOBuilder> {
  _$RepostDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _targetChatId;
  int? get targetChatId => _$this._targetChatId;
  set targetChatId(int? targetChatId) => _$this._targetChatId = targetChatId;

  RepostDTOBuilder() {
    RepostDTO._defaults(this);
  }

  RepostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _postId = $v.postId;
      _userId = $v.userId;
      _targetChatId = $v.targetChatId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepostDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RepostDTO;
  }

  @override
  void update(void Function(RepostDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RepostDTO build() => _build();

  _$RepostDTO _build() {
    final _$result = _$v ??
        new _$RepostDTO._(
          id: id,
          postId: postId,
          userId: userId,
          targetChatId: targetChatId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
