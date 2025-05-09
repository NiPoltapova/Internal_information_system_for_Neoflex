//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sort_object.g.dart';

/// SortObject
///
/// Properties:
/// * [empty] 
/// * [sorted] 
/// * [unsorted] 
@BuiltValue()
abstract class SortObject implements Built<SortObject, SortObjectBuilder> {
  @BuiltValueField(wireName: r'empty')
  bool? get empty;

  @BuiltValueField(wireName: r'sorted')
  bool? get sorted;

  @BuiltValueField(wireName: r'unsorted')
  bool? get unsorted;

  SortObject._();

  factory SortObject([void updates(SortObjectBuilder b)]) = _$SortObject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SortObjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SortObject> get serializer => _$SortObjectSerializer();
}

class _$SortObjectSerializer implements PrimitiveSerializer<SortObject> {
  @override
  final Iterable<Type> types = const [SortObject, _$SortObject];

  @override
  final String wireName = r'SortObject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SortObject object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.empty != null) {
      yield r'empty';
      yield serializers.serialize(
        object.empty,
        specifiedType: const FullType(bool),
      );
    }
    if (object.sorted != null) {
      yield r'sorted';
      yield serializers.serialize(
        object.sorted,
        specifiedType: const FullType(bool),
      );
    }
    if (object.unsorted != null) {
      yield r'unsorted';
      yield serializers.serialize(
        object.unsorted,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SortObject object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SortObjectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'empty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.empty = valueDes;
          break;
        case r'sorted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.sorted = valueDes;
          break;
        case r'unsorted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.unsorted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SortObject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SortObjectBuilder();
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

