// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FileDTO extends FileDTO {
  @override
  final int? id;
  @override
  final String? fileName;
  @override
  final String? fileUrl;
  @override
  final String? fileType;
  @override
  final DateTime? uploadedWhen;
  @override
  final int? uploadedBy;
  @override
  final int? messageId;

  factory _$FileDTO([void Function(FileDTOBuilder)? updates]) =>
      (new FileDTOBuilder()..update(updates))._build();

  _$FileDTO._(
      {this.id,
      this.fileName,
      this.fileUrl,
      this.fileType,
      this.uploadedWhen,
      this.uploadedBy,
      this.messageId})
      : super._();

  @override
  FileDTO rebuild(void Function(FileDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileDTOBuilder toBuilder() => new FileDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileDTO &&
        id == other.id &&
        fileName == other.fileName &&
        fileUrl == other.fileUrl &&
        fileType == other.fileType &&
        uploadedWhen == other.uploadedWhen &&
        uploadedBy == other.uploadedBy &&
        messageId == other.messageId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, fileUrl.hashCode);
    _$hash = $jc(_$hash, fileType.hashCode);
    _$hash = $jc(_$hash, uploadedWhen.hashCode);
    _$hash = $jc(_$hash, uploadedBy.hashCode);
    _$hash = $jc(_$hash, messageId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileDTO')
          ..add('id', id)
          ..add('fileName', fileName)
          ..add('fileUrl', fileUrl)
          ..add('fileType', fileType)
          ..add('uploadedWhen', uploadedWhen)
          ..add('uploadedBy', uploadedBy)
          ..add('messageId', messageId))
        .toString();
  }
}

class FileDTOBuilder implements Builder<FileDTO, FileDTOBuilder> {
  _$FileDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  String? _fileType;
  String? get fileType => _$this._fileType;
  set fileType(String? fileType) => _$this._fileType = fileType;

  DateTime? _uploadedWhen;
  DateTime? get uploadedWhen => _$this._uploadedWhen;
  set uploadedWhen(DateTime? uploadedWhen) =>
      _$this._uploadedWhen = uploadedWhen;

  int? _uploadedBy;
  int? get uploadedBy => _$this._uploadedBy;
  set uploadedBy(int? uploadedBy) => _$this._uploadedBy = uploadedBy;

  int? _messageId;
  int? get messageId => _$this._messageId;
  set messageId(int? messageId) => _$this._messageId = messageId;

  FileDTOBuilder() {
    FileDTO._defaults(this);
  }

  FileDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fileName = $v.fileName;
      _fileUrl = $v.fileUrl;
      _fileType = $v.fileType;
      _uploadedWhen = $v.uploadedWhen;
      _uploadedBy = $v.uploadedBy;
      _messageId = $v.messageId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileDTO;
  }

  @override
  void update(void Function(FileDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileDTO build() => _build();

  _$FileDTO _build() {
    final _$result = _$v ??
        new _$FileDTO._(
          id: id,
          fileName: fileName,
          fileUrl: fileUrl,
          fileType: fileType,
          uploadedWhen: uploadedWhen,
          uploadedBy: uploadedBy,
          messageId: messageId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
