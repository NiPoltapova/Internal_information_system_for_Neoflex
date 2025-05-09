// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageDTO extends MessageDTO {
  @override
  final int? id;
  @override
  final DateTime? createdWhen;
  @override
  final String? text;
  @override
  final String? status;
  @override
  final int? chatId;
  @override
  final int? userId;
  @override
  final BuiltList<FileDTO>? files;

  factory _$MessageDTO([void Function(MessageDTOBuilder)? updates]) =>
      (new MessageDTOBuilder()..update(updates))._build();

  _$MessageDTO._(
      {this.id,
      this.createdWhen,
      this.text,
      this.status,
      this.chatId,
      this.userId,
      this.files})
      : super._();

  @override
  MessageDTO rebuild(void Function(MessageDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageDTOBuilder toBuilder() => new MessageDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageDTO &&
        id == other.id &&
        createdWhen == other.createdWhen &&
        text == other.text &&
        status == other.status &&
        chatId == other.chatId &&
        userId == other.userId &&
        files == other.files;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, chatId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, files.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageDTO')
          ..add('id', id)
          ..add('createdWhen', createdWhen)
          ..add('text', text)
          ..add('status', status)
          ..add('chatId', chatId)
          ..add('userId', userId)
          ..add('files', files))
        .toString();
  }
}

class MessageDTOBuilder implements Builder<MessageDTO, MessageDTOBuilder> {
  _$MessageDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdWhen;
  DateTime? get createdWhen => _$this._createdWhen;
  set createdWhen(DateTime? createdWhen) => _$this._createdWhen = createdWhen;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _chatId;
  int? get chatId => _$this._chatId;
  set chatId(int? chatId) => _$this._chatId = chatId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  ListBuilder<FileDTO>? _files;
  ListBuilder<FileDTO> get files =>
      _$this._files ??= new ListBuilder<FileDTO>();
  set files(ListBuilder<FileDTO>? files) => _$this._files = files;

  MessageDTOBuilder() {
    MessageDTO._defaults(this);
  }

  MessageDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdWhen = $v.createdWhen;
      _text = $v.text;
      _status = $v.status;
      _chatId = $v.chatId;
      _userId = $v.userId;
      _files = $v.files?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageDTO;
  }

  @override
  void update(void Function(MessageDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageDTO build() => _build();

  _$MessageDTO _build() {
    _$MessageDTO _$result;
    try {
      _$result = _$v ??
          new _$MessageDTO._(
            id: id,
            createdWhen: createdWhen,
            text: text,
            status: status,
            chatId: chatId,
            userId: userId,
            files: _files?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        _files?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessageDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
