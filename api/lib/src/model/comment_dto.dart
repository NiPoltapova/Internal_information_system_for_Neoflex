//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_dto.g.dart';

/// CommentDTO
///
/// Properties:
/// * [id] 
/// * [createdWhen] 
/// * [postId] 
/// * [userId] 
/// * [text] 
/// * [answerToComm] 
@BuiltValue()
abstract class CommentDTO implements Built<CommentDTO, CommentDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  @BuiltValueField(wireName: r'postId')
  int? get postId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'answerToComm')
  String? get answerToComm;

  CommentDTO._();

  factory CommentDTO([void updates(CommentDTOBuilder b)]) = _$CommentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentDTO> get serializer => _$CommentDTOSerializer();
}

class _$CommentDTOSerializer implements PrimitiveSerializer<CommentDTO> {
  @override
  final Iterable<Type> types = const [CommentDTO, _$CommentDTO];

  @override
  final String wireName = r'CommentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommentDTO object, {
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
    if (object.postId != null) {
      yield r'postId';
      yield serializers.serialize(
        object.postId,
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
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType(String),
      );
    }
    if (object.answerToComm != null) {
      yield r'answerToComm';
      yield serializers.serialize(
        object.answerToComm,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentDTOBuilder result,
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
        case r'postId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        case r'answerToComm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.answerToComm = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CommentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentDTOBuilder();
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

