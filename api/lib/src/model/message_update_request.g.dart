// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_update_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageUpdateRequest extends MessageUpdateRequest {
  @override
  final String? text;
  @override
  final BuiltList<Uint8List>? files;

  factory _$MessageUpdateRequest(
          [void Function(MessageUpdateRequestBuilder)? updates]) =>
      (new MessageUpdateRequestBuilder()..update(updates))._build();

  _$MessageUpdateRequest._({this.text, this.files}) : super._();

  @override
  MessageUpdateRequest rebuild(
          void Function(MessageUpdateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageUpdateRequestBuilder toBuilder() =>
      new MessageUpdateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageUpdateRequest &&
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
    return (newBuiltValueToStringHelper(r'MessageUpdateRequest')
          ..add('text', text)
          ..add('files', files))
        .toString();
  }
}

class MessageUpdateRequestBuilder
    implements Builder<MessageUpdateRequest, MessageUpdateRequestBuilder> {
  _$MessageUpdateRequest? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<Uint8List>? _files;
  ListBuilder<Uint8List> get files =>
      _$this._files ??= new ListBuilder<Uint8List>();
  set files(ListBuilder<Uint8List>? files) => _$this._files = files;

  MessageUpdateRequestBuilder() {
    MessageUpdateRequest._defaults(this);
  }

  MessageUpdateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _files = $v.files?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageUpdateRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageUpdateRequest;
  }

  @override
  void update(void Function(MessageUpdateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageUpdateRequest build() => _build();

  _$MessageUpdateRequest _build() {
    _$MessageUpdateRequest _$result;
    try {
      _$result = _$v ??
          new _$MessageUpdateRequest._(
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
            r'MessageUpdateRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
