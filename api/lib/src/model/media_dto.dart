//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_dto.g.dart';

/// DTO для представления медиа-вложений
///
/// Properties:
/// * [id] - Уникальный идентификатор медиа
/// * [mediaType] - Тип медиа-контента
/// * [mimeType] - MIME-тип файла
/// * [fileName] - Оригинальное имя файла
/// * [downloadUrl] - URL для скачивания файла
/// * [fileSize] - Размер файла в байтах
/// * [uploadedWhen] - Дата и время загрузки
/// * [postId] - ID связанного поста
@BuiltValue()
abstract class MediaDTO implements Built<MediaDTO, MediaDTOBuilder> {
  /// Уникальный идентификатор медиа
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Тип медиа-контента
  @BuiltValueField(wireName: r'mediaType')
  MediaDTOMediaTypeEnum? get mediaType;
  // enum mediaTypeEnum {  IMAGE,  VIDEO,  AUDIO,  DOCUMENT,  ARCHIVE,  OTHER,  };

  /// MIME-тип файла
  @BuiltValueField(wireName: r'mimeType')
  String? get mimeType;

  /// Оригинальное имя файла
  @BuiltValueField(wireName: r'fileName')
  String? get fileName;

  /// URL для скачивания файла
  @BuiltValueField(wireName: r'downloadUrl')
  String? get downloadUrl;

  /// Размер файла в байтах
  @BuiltValueField(wireName: r'fileSize')
  int? get fileSize;

  /// Дата и время загрузки
  @BuiltValueField(wireName: r'uploadedWhen')
  DateTime? get uploadedWhen;

  /// ID связанного поста
  @BuiltValueField(wireName: r'postId')
  int? get postId;

  MediaDTO._();

  factory MediaDTO([void updates(MediaDTOBuilder b)]) = _$MediaDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaDTO> get serializer => _$MediaDTOSerializer();
}

class _$MediaDTOSerializer implements PrimitiveSerializer<MediaDTO> {
  @override
  final Iterable<Type> types = const [MediaDTO, _$MediaDTO];

  @override
  final String wireName = r'MediaDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.mediaType != null) {
      yield r'mediaType';
      yield serializers.serialize(
        object.mediaType,
        specifiedType: const FullType(MediaDTOMediaTypeEnum),
      );
    }
    if (object.mimeType != null) {
      yield r'mimeType';
      yield serializers.serialize(
        object.mimeType,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileName != null) {
      yield r'fileName';
      yield serializers.serialize(
        object.fileName,
        specifiedType: const FullType(String),
      );
    }
    if (object.downloadUrl != null) {
      yield r'downloadUrl';
      yield serializers.serialize(
        object.downloadUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileSize != null) {
      yield r'fileSize';
      yield serializers.serialize(
        object.fileSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.uploadedWhen != null) {
      yield r'uploadedWhen';
      yield serializers.serialize(
        object.uploadedWhen,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.postId != null) {
      yield r'postId';
      yield serializers.serialize(
        object.postId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'mediaType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaDTOMediaTypeEnum),
          ) as MediaDTOMediaTypeEnum;
          result.mediaType = valueDes;
          break;
        case r'mimeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
          break;
        case r'fileName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'downloadUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.downloadUrl = valueDes;
          break;
        case r'fileSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fileSize = valueDes;
          break;
        case r'uploadedWhen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.uploadedWhen = valueDes;
          break;
        case r'postId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaDTOBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class MediaDTOMediaTypeEnum extends EnumClass {

  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'IMAGE')
  static const MediaDTOMediaTypeEnum IMAGE = _$mediaDTOMediaTypeEnum_IMAGE;
  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'VIDEO')
  static const MediaDTOMediaTypeEnum VIDEO = _$mediaDTOMediaTypeEnum_VIDEO;
  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'AUDIO')
  static const MediaDTOMediaTypeEnum AUDIO = _$mediaDTOMediaTypeEnum_AUDIO;
  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'DOCUMENT')
  static const MediaDTOMediaTypeEnum DOCUMENT = _$mediaDTOMediaTypeEnum_DOCUMENT;
  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'ARCHIVE')
  static const MediaDTOMediaTypeEnum ARCHIVE = _$mediaDTOMediaTypeEnum_ARCHIVE;
  /// Тип медиа-контента
  @BuiltValueEnumConst(wireName: r'OTHER')
  static const MediaDTOMediaTypeEnum OTHER = _$mediaDTOMediaTypeEnum_OTHER;

  static Serializer<MediaDTOMediaTypeEnum> get serializer => _$mediaDTOMediaTypeEnumSerializer;

  const MediaDTOMediaTypeEnum._(String name): super(name);

  static BuiltSet<MediaDTOMediaTypeEnum> get values => _$mediaDTOMediaTypeEnumValues;
  static MediaDTOMediaTypeEnum valueOf(String name) => _$mediaDTOMediaTypeEnumValueOf(name);
}

