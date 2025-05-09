//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/file_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_dto.g.dart';

/// MessageDTO
///
/// Properties:
/// * [id] 
/// * [createdWhen] 
/// * [text] 
/// * [status] 
/// * [chatId] 
/// * [userId] 
/// * [files] 
@BuiltValue()
abstract class MessageDTO implements Built<MessageDTO, MessageDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'chatId')
  int? get chatId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'files')
  BuiltList<FileDTO>? get files;

  MessageDTO._();

  factory MessageDTO([void updates(MessageDTOBuilder b)]) = _$MessageDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageDTO> get serializer => _$MessageDTOSerializer();
}

class _$MessageDTOSerializer implements PrimitiveSerializer<MessageDTO> {
  @override
  final Iterable<Type> types = const [MessageDTO, _$MessageDTO];

  @override
  final String wireName = r'MessageDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.createdWhen != null) {
      yield r'createdWhen';
      yield serializers.serialize(
        object.createdWhen,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.chatId != null) {
      yield r'chatId';
      yield serializers.serialize(
        object.chatId,
        specifiedType: const FullType(int),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.files != null) {
      yield r'files';
      yield serializers.serialize(
        object.files,
        specifiedType: const FullType(BuiltList, [FullType(FileDTO)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageDTOBuilder result,
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
        case r'createdWhen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdWhen = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'chatId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.chatId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'files':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(FileDTO)]),
          ) as BuiltList<FileDTO>;
          result.files.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessageDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageDTOBuilder();
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

