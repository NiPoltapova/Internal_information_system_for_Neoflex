//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_update_request.g.dart';

/// MessageUpdateRequest
///
/// Properties:
/// * [text] 
/// * [files] 
@BuiltValue()
abstract class MessageUpdateRequest implements Built<MessageUpdateRequest, MessageUpdateRequestBuilder> {
  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'files')
  BuiltList<Uint8List>? get files;

  MessageUpdateRequest._();

  factory MessageUpdateRequest([void updates(MessageUpdateRequestBuilder b)]) = _$MessageUpdateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageUpdateRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageUpdateRequest> get serializer => _$MessageUpdateRequestSerializer();
}

class _$MessageUpdateRequestSerializer implements PrimitiveSerializer<MessageUpdateRequest> {
  @override
  final Iterable<Type> types = const [MessageUpdateRequest, _$MessageUpdateRequest];

  @override
  final String wireName = r'MessageUpdateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageUpdateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType(String),
      );
    }
    if (object.files != null) {
      yield r'files';
      yield serializers.serialize(
        object.files,
        specifiedType: const FullType(BuiltList, [FullType(Uint8List)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageUpdateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageUpdateRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        case r'files':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Uint8List)]),
          ) as BuiltList<Uint8List>;
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
  MessageUpdateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageUpdateRequestBuilder();
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

