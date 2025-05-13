//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/message_dto.dart';
import 'package:openapi/src/model/user_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_notification_dto.g.dart';

/// MessageNotificationDTO
///
/// Properties:
/// * [id] 
/// * [recipient] 
/// * [sender] 
/// * [content] 
/// * [timestamp] 
/// * [linkedMessage] 
/// * [read] 
@BuiltValue()
abstract class MessageNotificationDTO implements Built<MessageNotificationDTO, MessageNotificationDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'recipient')
  UserDTO? get recipient;

  @BuiltValueField(wireName: r'sender')
  UserDTO? get sender;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'timestamp')
  DateTime? get timestamp;

  @BuiltValueField(wireName: r'linkedMessage')
  MessageDTO? get linkedMessage;

  @BuiltValueField(wireName: r'read')
  bool? get read;

  MessageNotificationDTO._();

  factory MessageNotificationDTO([void updates(MessageNotificationDTOBuilder b)]) = _$MessageNotificationDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageNotificationDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageNotificationDTO> get serializer => _$MessageNotificationDTOSerializer();
}

class _$MessageNotificationDTOSerializer implements PrimitiveSerializer<MessageNotificationDTO> {
  @override
  final Iterable<Type> types = const [MessageNotificationDTO, _$MessageNotificationDTO];

  @override
  final String wireName = r'MessageNotificationDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageNotificationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.recipient != null) {
      yield r'recipient';
      yield serializers.serialize(
        object.recipient,
        specifiedType: const FullType(UserDTO),
      );
    }
    if (object.sender != null) {
      yield r'sender';
      yield serializers.serialize(
        object.sender,
        specifiedType: const FullType(UserDTO),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
    if (object.timestamp != null) {
      yield r'timestamp';
      yield serializers.serialize(
        object.timestamp,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.linkedMessage != null) {
      yield r'linkedMessage';
      yield serializers.serialize(
        object.linkedMessage,
        specifiedType: const FullType(MessageDTO),
      );
    }
    if (object.read != null) {
      yield r'read';
      yield serializers.serialize(
        object.read,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageNotificationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageNotificationDTOBuilder result,
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
        case r'recipient':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserDTO),
          ) as UserDTO;
          result.recipient.replace(valueDes);
          break;
        case r'sender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserDTO),
          ) as UserDTO;
          result.sender.replace(valueDes);
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.timestamp = valueDes;
          break;
        case r'linkedMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MessageDTO),
          ) as MessageDTO;
          result.linkedMessage.replace(valueDes);
          break;
        case r'read':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.read = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessageNotificationDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageNotificationDTOBuilder();
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

