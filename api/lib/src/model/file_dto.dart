//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'file_dto.g.dart';

/// FileDTO
///
/// Properties:
/// * [id] 
/// * [fileName] 
/// * [fileUrl] 
/// * [fileType] 
/// * [uploadedWhen] 
/// * [uploadedBy] 
/// * [messageId] 
@BuiltValue()
abstract class FileDTO implements Built<FileDTO, FileDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'fileName')
  String? get fileName;

  @BuiltValueField(wireName: r'fileUrl')
  String? get fileUrl;

  @BuiltValueField(wireName: r'fileType')
  String? get fileType;

  @BuiltValueField(wireName: r'uploadedWhen')
  DateTime? get uploadedWhen;

  @BuiltValueField(wireName: r'uploadedBy')
  int? get uploadedBy;

  @BuiltValueField(wireName: r'messageId')
  int? get messageId;

  FileDTO._();

  factory FileDTO([void updates(FileDTOBuilder b)]) = _$FileDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FileDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FileDTO> get serializer => _$FileDTOSerializer();
}

class _$FileDTOSerializer implements PrimitiveSerializer<FileDTO> {
  @override
  final Iterable<Type> types = const [FileDTO, _$FileDTO];

  @override
  final String wireName = r'FileDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FileDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.fileName != null) {
      yield r'fileName';
      yield serializers.serialize(
        object.fileName,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileUrl != null) {
      yield r'fileUrl';
      yield serializers.serialize(
        object.fileUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileType != null) {
      yield r'fileType';
      yield serializers.serialize(
        object.fileType,
        specifiedType: const FullType(String),
      );
    }
    if (object.uploadedWhen != null) {
      yield r'uploadedWhen';
      yield serializers.serialize(
        object.uploadedWhen,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.uploadedBy != null) {
      yield r'uploadedBy';
      yield serializers.serialize(
        object.uploadedBy,
        specifiedType: const FullType(int),
      );
    }
    if (object.messageId != null) {
      yield r'messageId';
      yield serializers.serialize(
        object.messageId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FileDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FileDTOBuilder result,
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
        case r'fileName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'fileUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileUrl = valueDes;
          break;
        case r'fileType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileType = valueDes;
          break;
        case r'uploadedWhen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.uploadedWhen = valueDes;
          break;
        case r'uploadedBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.uploadedBy = valueDes;
          break;
        case r'messageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.messageId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FileDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FileDTOBuilder();
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

