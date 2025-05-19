// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_create_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageCreateRequest extends MessageCreateRequest {
  @override
  final String? text;
  @override
  final BuiltList<Uint8List>? files;

  factory _$MessageCreateRequest(
          [void Function(MessageCreateRequestBuilder)? updates]) =>
      (new MessageCreateRequestBuilder()..update(updates))._build();

  _$MessageCreateRequest._({this.text, this.files}) : super._();

  @override
  MessageCreateRequest rebuild(
          void Function(MessageCreateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageCreateRequestBuilder toBuilder() =>
      new MessageCreateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageCreateRequest &&
        text == other.text &&
        files == other.files;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, files.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageCreateRequest')
          ..add('text', text)
          ..add('files', files))
        .toString();
  }
}

class MessageCreateRequestBuilder
    implements Builder<MessageCreateRequest, MessageCreateRequestBuilder> {
  _$MessageCreateRequest? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<Uint8List>? _files;
  ListBuilder<Uint8List> get files =>
      _$this._files ??= new ListBuilder<Uint8List>();
  set files(ListBuilder<Uint8List>? files) => _$this._files = files;

  MessageCreateRequestBuilder() {
    MessageCreateRequest._defaults(this);
  }

  MessageCreateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _files = $v.files?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageCreateRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageCreateRequest;
  }

  @override
  void update(void Function(MessageCreateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageCreateRequest build() => _build();

  _$MessageCreateRequest _build() {
    _$MessageCreateRequest _$result;
    try {
      _$result = _$v ??
          new _$MessageCreateRequest._(
            text: text,
            files: _files?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        _files?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessageCreateRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
