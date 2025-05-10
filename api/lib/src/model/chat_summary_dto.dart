//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_summary_dto.g.dart';

/// ChatSummaryDTO
///
/// Properties:
/// * [id] 
/// * [chatType] 
/// * [chatName] 
/// * [lastActivity] 
/// * [unreadCount] 
/// * [lastMessagePreview] 
@BuiltValue()
abstract class ChatSummaryDTO implements Built<ChatSummaryDTO, ChatSummaryDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'chatType')
  String? get chatType;

  @BuiltValueField(wireName: r'chatName')
  String? get chatName;

  @BuiltValueField(wireName: r'lastActivity')
  DateTime? get lastActivity;

  @BuiltValueField(wireName: r'unreadCount')
  int? get unreadCount;

  @BuiltValueField(wireName: r'lastMessagePreview')
  String? get lastMessagePreview;

  ChatSummaryDTO._();

  factory ChatSummaryDTO([void updates(ChatSummaryDTOBuilder b)]) = _$ChatSummaryDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatSummaryDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatSummaryDTO> get serializer => _$ChatSummaryDTOSerializer();
}

class _$ChatSummaryDTOSerializer implements PrimitiveSerializer<ChatSummaryDTO> {
  @override
  final Iterable<Type> types = const [ChatSummaryDTO, _$ChatSummaryDTO];

  @override
  final String wireName = r'ChatSummaryDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatSummaryDTO object, {
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
    if (object.lastActivity != null) {
      yield r'lastActivity';
      yield serializers.serialize(
        object.lastActivity,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.unreadCount != null) {
      yield r'unreadCount';
      yield serializers.serialize(
        object.unreadCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.lastMessagePreview != null) {
      yield r'lastMessagePreview';
      yield serializers.serialize(
        object.lastMessagePreview,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatSummaryDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatSummaryDTOBuilder result,
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
        case r'lastActivity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastActivity = valueDes;
          break;
        case r'unreadCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.unreadCount = valueDes;
          break;
        case r'lastMessagePreview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastMessagePreview = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatSummaryDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatSummaryDTOBuilder();
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

