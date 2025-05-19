//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response_dto.g.dart';

/// PostResponseDTO
///
/// Properties:
/// * [id]
/// * [createdWhen]
/// * [text]
/// * [media]
/// * [userId]
/// * [likeCount]
/// * [commentCount]
/// * [repostCount]
/// * [liked]
@BuiltValue()
abstract class PostResponseDTO
    implements Built<PostResponseDTO, PostResponseDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'media')
  BuiltList<MediaDTO>? get media;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'likeCount')
  int? get likeCount;

  @BuiltValueField(wireName: r'commentCount')
  int? get commentCount;

  @BuiltValueField(wireName: r'repostCount')
  int? get repostCount;

  @BuiltValueField(wireName: r'liked')
  bool? get liked;

  PostResponseDTO._();

  factory PostResponseDTO([void updates(PostResponseDTOBuilder b)]) =
      _$PostResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostResponseDTO> get serializer =>
      _$PostResponseDTOSerializer();
}

class _$PostResponseDTOSerializer
    implements PrimitiveSerializer<PostResponseDTO> {
  @override
  final Iterable<Type> types = const [PostResponseDTO, _$PostResponseDTO];

  @override
  final String wireName = r'PostResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostResponseDTO object, {
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
    if (object.media != null) {
      yield r'media';
      yield serializers.serialize(
        object.media,
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
    if (object.likeCount != null) {
      yield r'likeCount';
      yield serializers.serialize(
        object.likeCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.commentCount != null) {
      yield r'commentCount';
      yield serializers.serialize(
        object.commentCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.repostCount != null) {
      yield r'repostCount';
      yield serializers.serialize(
        object.repostCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.liked != null) {
      yield r'liked';
      yield serializers.serialize(
        object.liked,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostResponseDTOBuilder result,
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
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MediaDTO)]),
          ) as BuiltList<MediaDTO>;
          result.media.replace(valueDes);
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'likeCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likeCount = valueDes;
          break;
        case r'commentCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.commentCount = valueDes;
          break;
        case r'repostCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.repostCount = valueDes;
          break;
        case r'liked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.liked = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostResponseDTOBuilder();
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
