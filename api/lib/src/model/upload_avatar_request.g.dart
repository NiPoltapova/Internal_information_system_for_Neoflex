// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_avatar_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadAvatarRequest extends UploadAvatarRequest {
  @override
  final Uint8List file;

  factory _$UploadAvatarRequest(
          [void Function(UploadAvatarRequestBuilder)? updates]) =>
      (new UploadAvatarRequestBuilder()..update(updates))._build();

  _$UploadAvatarRequest._({required this.file}) : super._() {
    BuiltValueNullFieldError.checkNotNull(file, r'UploadAvatarRequest', 'file');
  }

  @override
  UploadAvatarRequest rebuild(
          void Function(UploadAvatarRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadAvatarRequestBuilder toBuilder() =>
      new UploadAvatarRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadAvatarRequest && file == other.file;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UploadAvatarRequest')
          ..add('file', file))
        .toString();
  }
}

class UploadAvatarRequestBuilder
    implements Builder<UploadAvatarRequest, UploadAvatarRequestBuilder> {
  _$UploadAvatarRequest? _$v;

  Uint8List? _file;
  Uint8List? get file => _$this._file;
  set file(Uint8List? file) => _$this._file = file;

  UploadAvatarRequestBuilder() {
    UploadAvatarRequest._defaults(this);
  }

  UploadAvatarRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _file = $v.file;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadAvatarRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UploadAvatarRequest;
  }

  @override
  void update(void Function(UploadAvatarRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UploadAvatarRequest build() => _build();

  _$UploadAvatarRequest _build() {
    final _$result = _$v ??
        new _$UploadAvatarRequest._(
          file: BuiltValueNullFieldError.checkNotNull(
              file, r'UploadAvatarRequest', 'file'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
