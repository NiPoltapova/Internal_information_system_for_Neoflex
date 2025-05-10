// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatSummaryDTO extends ChatSummaryDTO {
  @override
  final int? id;
  @override
  final String? chatType;
  @override
  final String? chatName;
  @override
  final DateTime? lastActivity;
  @override
  final int? unreadCount;
  @override
  final String? lastMessagePreview;

  factory _$ChatSummaryDTO([void Function(ChatSummaryDTOBuilder)? updates]) =>
      (new ChatSummaryDTOBuilder()..update(updates))._build();

  _$ChatSummaryDTO._(
      {this.id,
      this.chatType,
      this.chatName,
      this.lastActivity,
      this.unreadCount,
      this.lastMessagePreview})
      : super._();

  @override
  ChatSummaryDTO rebuild(void Function(ChatSummaryDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatSummaryDTOBuilder toBuilder() =>
      new ChatSummaryDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatSummaryDTO &&
        id == other.id &&
        chatType == other.chatType &&
        chatName == other.chatName &&
        lastActivity == other.lastActivity &&
        unreadCount == other.unreadCount &&
        lastMessagePreview == other.lastMessagePreview;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, chatType.hashCode);
    _$hash = $jc(_$hash, chatName.hashCode);
    _$hash = $jc(_$hash, lastActivity.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jc(_$hash, lastMessagePreview.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatSummaryDTO')
          ..add('id', id)
          ..add('chatType', chatType)
          ..add('chatName', chatName)
          ..add('lastActivity', lastActivity)
          ..add('unreadCount', unreadCount)
          ..add('lastMessagePreview', lastMessagePreview))
        .toString();
  }
}

class ChatSummaryDTOBuilder
    implements Builder<ChatSummaryDTO, ChatSummaryDTOBuilder> {
  _$ChatSummaryDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _chatType;
  String? get chatType => _$this._chatType;
  set chatType(String? chatType) => _$this._chatType = chatType;

  String? _chatName;
  String? get chatName => _$this._chatName;
  set chatName(String? chatName) => _$this._chatName = chatName;

  DateTime? _lastActivity;
  DateTime? get lastActivity => _$this._lastActivity;
  set lastActivity(DateTime? lastActivity) =>
      _$this._lastActivity = lastActivity;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  String? _lastMessagePreview;
  String? get lastMessagePreview => _$this._lastMessagePreview;
  set lastMessagePreview(String? lastMessagePreview) =>
      _$this._lastMessagePreview = lastMessagePreview;

  ChatSummaryDTOBuilder() {
    ChatSummaryDTO._defaults(this);
  }

  ChatSummaryDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _chatType = $v.chatType;
      _chatName = $v.chatName;
      _lastActivity = $v.lastActivity;
      _unreadCount = $v.unreadCount;
      _lastMessagePreview = $v.lastMessagePreview;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatSummaryDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatSummaryDTO;
  }

  @override
  void update(void Function(ChatSummaryDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatSummaryDTO build() => _build();

  _$ChatSummaryDTO _build() {
    final _$result = _$v ??
        new _$ChatSummaryDTO._(
          id: id,
          chatType: chatType,
          chatName: chatName,
          lastActivity: lastActivity,
          unreadCount: unreadCount,
          lastMessagePreview: lastMessagePreview,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
