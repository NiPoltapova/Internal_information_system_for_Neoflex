//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_dto.g.dart';

/// PostDTO
///
/// Properties:
/// * [id] 
/// * [createdWhen] 
/// * [title] 
/// * [text] 
/// * [mediaUrls] 
/// * [userId] 
@BuiltValue()
abstract class PostDTO implements Built<PostDTO, PostDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'mediaUrls')
  BuiltList<MediaDTO>? get mediaUrls;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  PostDTO._();

  factory PostDTO([void updates(PostDTOBuilder b)]) = _$PostDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostDTO> get serializer => _$PostDTOSerializer();
}

class _$PostDTOSerializer implements PrimitiveSerializer<PostDTO> {
  @override
  final Iterable<Type> types = const [PostDTO, _$PostDTO];

  @override
  final String wireName = r'PostDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostDTO object, {
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
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType(String),
      );
    }
    if (object.mediaUrls != null) {
      yield r'mediaUrls';
      yield serializers.serialize(
        object.mediaUrls,
        specifiedType: const FullType(BuiltList, [FullType(MediaDTO)]),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostDTOBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        case r'mediaUrls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MediaDTO)]),
          ) as BuiltList<MediaDTO>;
          result.mediaUrls.replace(valueDes);
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostDTOBuilder();
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

