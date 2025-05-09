// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_IMAGE =
    const MediaDTOMediaTypeEnum._('IMAGE');
const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_VIDEO =
    const MediaDTOMediaTypeEnum._('VIDEO');
const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_AUDIO =
    const MediaDTOMediaTypeEnum._('AUDIO');
const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_DOCUMENT =
    const MediaDTOMediaTypeEnum._('DOCUMENT');
const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_ARCHIVE =
    const MediaDTOMediaTypeEnum._('ARCHIVE');
const MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnum_OTHER =
    const MediaDTOMediaTypeEnum._('OTHER');

MediaDTOMediaTypeEnum _$mediaDTOMediaTypeEnumValueOf(String name) {
  switch (name) {
    case 'IMAGE':
      return _$mediaDTOMediaTypeEnum_IMAGE;
    case 'VIDEO':
      return _$mediaDTOMediaTypeEnum_VIDEO;
    case 'AUDIO':
      return _$mediaDTOMediaTypeEnum_AUDIO;
    case 'DOCUMENT':
      return _$mediaDTOMediaTypeEnum_DOCUMENT;
    case 'ARCHIVE':
      return _$mediaDTOMediaTypeEnum_ARCHIVE;
    case 'OTHER':
      return _$mediaDTOMediaTypeEnum_OTHER;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MediaDTOMediaTypeEnum> _$mediaDTOMediaTypeEnumValues =
    new BuiltSet<MediaDTOMediaTypeEnum>(const <MediaDTOMediaTypeEnum>[
  _$mediaDTOMediaTypeEnum_IMAGE,
  _$mediaDTOMediaTypeEnum_VIDEO,
  _$mediaDTOMediaTypeEnum_AUDIO,
  _$mediaDTOMediaTypeEnum_DOCUMENT,
  _$mediaDTOMediaTypeEnum_ARCHIVE,
  _$mediaDTOMediaTypeEnum_OTHER,
]);

Serializer<MediaDTOMediaTypeEnum> _$mediaDTOMediaTypeEnumSerializer =
    new _$MediaDTOMediaTypeEnumSerializer();

class _$MediaDTOMediaTypeEnumSerializer
    implements PrimitiveSerializer<MediaDTOMediaTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'IMAGE': 'IMAGE',
    'VIDEO': 'VIDEO',
    'AUDIO': 'AUDIO',
    'DOCUMENT': 'DOCUMENT',
    'ARCHIVE': 'ARCHIVE',
    'OTHER': 'OTHER',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'IMAGE': 'IMAGE',
    'VIDEO': 'VIDEO',
    'AUDIO': 'AUDIO',
    'DOCUMENT': 'DOCUMENT',
    'ARCHIVE': 'ARCHIVE',
    'OTHER': 'OTHER',
  };

  @override
  final Iterable<Type> types = const <Type>[MediaDTOMediaTypeEnum];
  @override
  final String wireName = 'MediaDTOMediaTypeEnum';

  @override
  Object serialize(Serializers serializers, MediaDTOMediaTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MediaDTOMediaTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaDTOMediaTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$MediaDTO extends MediaDTO {
  @override
  final int? id;
  @override
  final MediaDTOMediaTypeEnum? mediaType;
  @override
  final String? mimeType;
  @override
  final String? fileName;
  @override
  final String? downloadUrl;
  @override
  final int? fileSize;
  @override
  final DateTime? uploadedWhen;
  @override
  final int? postId;

  factory _$MediaDTO([void Function(MediaDTOBuilder)? updates]) =>
      (new MediaDTOBuilder()..update(updates))._build();

  _$MediaDTO._(
      {this.id,
      this.mediaType,
      this.mimeType,
      this.fileName,
      this.downloadUrl,
      this.fileSize,
      this.uploadedWhen,
      this.postId})
      : super._();

  @override
  MediaDTO rebuild(void Function(MediaDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaDTOBuilder toBuilder() => new MediaDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaDTO &&
        id == other.id &&
        mediaType == other.mediaType &&
        mimeType == other.mimeType &&
        fileName == other.fileName &&
        downloadUrl == other.downloadUrl &&
        fileSize == other.fileSize &&
        uploadedWhen == other.uploadedWhen &&
        postId == other.postId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, downloadUrl.hashCode);
    _$hash = $jc(_$hash, fileSize.hashCode);
    _$hash = $jc(_$hash, uploadedWhen.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaDTO')
          ..add('id', id)
          ..add('mediaType', mediaType)
          ..add('mimeType', mimeType)
          ..add('fileName', fileName)
          ..add('downloadUrl', downloadUrl)
          ..add('fileSize', fileSize)
          ..add('uploadedWhen', uploadedWhen)
          ..add('postId', postId))
        .toString();
  }
}

class MediaDTOBuilder implements Builder<MediaDTO, MediaDTOBuilder> {
  _$MediaDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  MediaDTOMediaTypeEnum? _mediaType;
  MediaDTOMediaTypeEnum? get mediaType => _$this._mediaType;
  set mediaType(MediaDTOMediaTypeEnum? mediaType) =>
      _$this._mediaType = mediaType;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _downloadUrl;
  String? get downloadUrl => _$this._downloadUrl;
  set downloadUrl(String? downloadUrl) => _$this._downloadUrl = downloadUrl;

  int? _fileSize;
  int? get fileSize => _$this._fileSize;
  set fileSize(int? fileSize) => _$this._fileSize = fileSize;

  DateTime? _uploadedWhen;
  DateTime? get uploadedWhen => _$this._uploadedWhen;
  set uploadedWhen(DateTime? uploadedWhen) =>
      _$this._uploadedWhen = uploadedWhen;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  MediaDTOBuilder() {
    MediaDTO._defaults(this);
  }

  MediaDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _mediaType = $v.mediaType;
      _mimeType = $v.mimeType;
      _fileName = $v.fileName;
      _downloadUrl = $v.downloadUrl;
      _fileSize = $v.fileSize;
      _uploadedWhen = $v.uploadedWhen;
      _postId = $v.postId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MediaDTO;
  }

  @override
  void update(void Function(MediaDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaDTO build() => _build();

  _$MediaDTO _build() {
    final _$result = _$v ??
        new _$MediaDTO._(
          id: id,
          mediaType: mediaType,
          mimeType: mimeType,
          fileName: fileName,
          downloadUrl: downloadUrl,
          fileSize: fileSize,
          uploadedWhen: uploadedWhen,
          postId: postId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
