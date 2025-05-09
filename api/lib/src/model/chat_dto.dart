//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_dto.g.dart';

/// ChatDTO
///
/// Properties:
/// * [id] 
/// * [chatType] 
/// * [chatName] 
/// * [createdWhen] 
/// * [createdBy] 
@BuiltValue()
abstract class ChatDTO implements Built<ChatDTO, ChatDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'chatType')
  String? get chatType;

  @BuiltValueField(wireName: r'chatName')
  String? get chatName;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  @BuiltValueField(wireName: r'createdBy')
  int? get createdBy;

  ChatDTO._();

  factory ChatDTO([void updates(ChatDTOBuilder b)]) = _$ChatDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatDTO> get serializer => _$ChatDTOSerializer();
}

class _$ChatDTOSerializer implements PrimitiveSerializer<ChatDTO> {
  @override
  final Iterable<Type> types = const [ChatDTO, _$ChatDTO];

  @override
  final String wireName = r'ChatDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.chatType != null) {
      yield r'chatType';
      yield serializers.serialize(
        object.chatType,
        specifiedType: const FullType(String),
      );
    }
    if (object.chatName != null) {
      yield r'chatName';
      yield serializers.serialize(
        object.chatName,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdWhen != null) {
      yield r'createdWhen';
      yield serializers.serialize(
        object.createdWhen,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.createdBy != null) {
      yield r'createdBy';
      yield serializers.serialize(
        object.createdBy,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatDTOBuilder result,
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
        case r'chatType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.chatType = valueDes;
          break;
        case r'chatName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.chatName = valueDes;
          break;
        case r'createdWhen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdWhen = valueDes;
          break;
        case r'createdBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.createdBy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatDTOBuilder();
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

