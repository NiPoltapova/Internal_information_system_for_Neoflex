// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_notification_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageNotificationDTO extends MessageNotificationDTO {
  @override
  final int? id;
  @override
  final UserDTO? recipient;
  @override
  final UserDTO? sender;
  @override
  final String? content;
  @override
  final DateTime? timestamp;
  @override
  final MessageDTO? linkedMessage;
  @override
  final bool? read;

  factory _$MessageNotificationDTO(
          [void Function(MessageNotificationDTOBuilder)? updates]) =>
      (new MessageNotificationDTOBuilder()..update(updates))._build();

  _$MessageNotificationDTO._(
      {this.id,
      this.recipient,
      this.sender,
      this.content,
      this.timestamp,
      this.linkedMessage,
      this.read})
      : super._();

  @override
  MessageNotificationDTO rebuild(
          void Function(MessageNotificationDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageNotificationDTOBuilder toBuilder() =>
      new MessageNotificationDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageNotificationDTO &&
        id == other.id &&
        recipient == other.recipient &&
        sender == other.sender &&
        content == other.content &&
        timestamp == other.timestamp &&
        linkedMessage == other.linkedMessage &&
        read == other.read;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, recipient.hashCode);
    _$hash = $jc(_$hash, sender.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, linkedMessage.hashCode);
    _$hash = $jc(_$hash, read.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageNotificationDTO')
          ..add('id', id)
          ..add('recipient', recipient)
          ..add('sender', sender)
          ..add('content', content)
          ..add('timestamp', timestamp)
          ..add('linkedMessage', linkedMessage)
          ..add('read', read))
        .toString();
  }
}

class MessageNotificationDTOBuilder
    implements Builder<MessageNotificationDTO, MessageNotificationDTOBuilder> {
  _$MessageNotificationDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UserDTOBuilder? _recipient;
  UserDTOBuilder get recipient => _$this._recipient ??= new UserDTOBuilder();
  set recipient(UserDTOBuilder? recipient) => _$this._recipient = recipient;

  UserDTOBuilder? _sender;
  UserDTOBuilder get sender => _$this._sender ??= new UserDTOBuilder();
  set sender(UserDTOBuilder? sender) => _$this._sender = sender;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  MessageDTOBuilder? _linkedMessage;
  MessageDTOBuilder get linkedMessage =>
      _$this._linkedMessage ??= new MessageDTOBuilder();
  set linkedMessage(MessageDTOBuilder? linkedMessage) =>
      _$this._linkedMessage = linkedMessage;

  bool? _read;
  bool? get read => _$this._read;
  set read(bool? read) => _$this._read = read;

  MessageNotificationDTOBuilder() {
    MessageNotificationDTO._defaults(this);
  }

  MessageNotificationDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _recipient = $v.recipient?.toBuilder();
      _sender = $v.sender?.toBuilder();
      _content = $v.content;
      _timestamp = $v.timestamp;
      _linkedMessage = $v.linkedMessage?.toBuilder();
      _read = $v.read;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageNotificationDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageNotificationDTO;
  }

  @override
  void update(void Function(MessageNotificationDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageNotificationDTO build() => _build();

  _$MessageNotificationDTO _build() {
    _$MessageNotificationDTO _$result;
    try {
      _$result = _$v ??
          new _$MessageNotificationDTO._(
            id: id,
            recipient: _recipient?.build(),
            sender: _sender?.build(),
            content: content,
            timestamp: timestamp,
            linkedMessage: _linkedMessage?.build(),
            read: read,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipient';
        _recipient?.build();
        _$failedField = 'sender';
        _sender?.build();

        _$failedField = 'linkedMessage';
        _linkedMessage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessageNotificationDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
