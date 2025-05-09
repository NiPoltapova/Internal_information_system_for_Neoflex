// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatDTO extends ChatDTO {
  @override
  final int? id;
  @override
  final String? chatType;
  @override
  final String? chatName;
  @override
  final DateTime? createdWhen;
  @override
  final int? createdBy;

  factory _$ChatDTO([void Function(ChatDTOBuilder)? updates]) =>
      (new ChatDTOBuilder()..update(updates))._build();

  _$ChatDTO._(
      {this.id, this.chatType, this.chatName, this.createdWhen, this.createdBy})
      : super._();

  @override
  ChatDTO rebuild(void Function(ChatDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatDTOBuilder toBuilder() => new ChatDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatDTO &&
        id == other.id &&
        chatType == other.chatType &&
        chatName == other.chatName &&
        createdWhen == other.createdWhen &&
        createdBy == other.createdBy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, chatType.hashCode);
    _$hash = $jc(_$hash, chatName.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatDTO')
          ..add('id', id)
          ..add('chatType', chatType)
          ..add('chatName', chatName)
          ..add('createdWhen', createdWhen)
          ..add('createdBy', createdBy))
        .toString();
  }
}

class ChatDTOBuilder implements Builder<ChatDTO, ChatDTOBuilder> {
  _$ChatDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _chatType;
  String? get chatType => _$this._chatType;
  set chatType(String? chatType) => _$this._chatType = chatType;

  String? _chatName;
  String? get chatName => _$this._chatName;
  set chatName(String? chatName) => _$this._chatName = chatName;

  DateTime? _createdWhen;
  DateTime? get createdWhen => _$this._createdWhen;
  set createdWhen(DateTime? createdWhen) => _$this._createdWhen = createdWhen;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  ChatDTOBuilder() {
    ChatDTO._defaults(this);
  }

  ChatDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _chatType = $v.chatType;
      _chatName = $v.chatName;
      _createdWhen = $v.createdWhen;
      _createdBy = $v.createdBy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatDTO;
  }

  @override
  void update(void Function(ChatDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatDTO build() => _build();

  _$ChatDTO _build() {
    final _$result = _$v ??
        new _$ChatDTO._(
          id: id,
          chatType: chatType,
          chatName: chatName,
          createdWhen: createdWhen,
          createdBy: createdBy,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
