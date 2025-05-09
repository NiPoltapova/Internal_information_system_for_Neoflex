//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'dart:typed_data';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_avatar_request.g.dart';

/// UploadAvatarRequest
///
/// Properties:
/// * [file] 
@BuiltValue()
abstract class UploadAvatarRequest implements Built<UploadAvatarRequest, UploadAvatarRequestBuilder> {
  @BuiltValueField(wireName: r'file')
  Uint8List get file;

  UploadAvatarRequest._();

  factory UploadAvatarRequest([void updates(UploadAvatarRequestBuilder b)]) = _$UploadAvatarRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadAvatarRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadAvatarRequest> get serializer => _$UploadAvatarRequestSerializer();
}

class _$UploadAvatarRequestSerializer implements PrimitiveSerializer<UploadAvatarRequest> {
  @override
  final Iterable<Type> types = const [UploadAvatarRequest, _$UploadAvatarRequest];

  @override
  final String wireName = r'UploadAvatarRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadAvatarRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'file';
    yield serializers.serialize(
      object.file,
      specifiedType: const FullType(Uint8List),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadAvatarRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadAvatarRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'file':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Uint8List),
          ) as Uint8List;
          result.file = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadAvatarRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadAvatarRequestBuilder();
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

