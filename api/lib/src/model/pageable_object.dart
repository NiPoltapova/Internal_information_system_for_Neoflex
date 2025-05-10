//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/sort_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pageable_object.g.dart';

/// PageableObject
///
/// Properties:
/// * [offset] 
/// * [sort] 
/// * [pageSize] 
/// * [pageNumber] 
/// * [paged] 
/// * [unpaged] 
@BuiltValue()
abstract class PageableObject implements Built<PageableObject, PageableObjectBuilder> {
  @BuiltValueField(wireName: r'offset')
  int? get offset;

  @BuiltValueField(wireName: r'sort')
  SortObject? get sort;

  @BuiltValueField(wireName: r'pageSize')
  int? get pageSize;

  @BuiltValueField(wireName: r'pageNumber')
  int? get pageNumber;

  @BuiltValueField(wireName: r'paged')
  bool? get paged;

  @BuiltValueField(wireName: r'unpaged')
  bool? get unpaged;

  PageableObject._();

  factory PageableObject([void updates(PageableObjectBuilder b)]) = _$PageableObject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageableObjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageableObject> get serializer => _$PageableObjectSerializer();
}

class _$PageableObjectSerializer implements PrimitiveSerializer<PageableObject> {
  @override
  final Iterable<Type> types = const [PageableObject, _$PageableObject];

  @override
  final String wireName = r'PageableObject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageableObject object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.offset != null) {
      yield r'offset';
      yield serializers.serialize(
        object.offset,
        specifiedType: const FullType(int),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(SortObject),
      );
    }
    if (object.pageSize != null) {
      yield r'pageSize';
      yield serializers.serialize(
        object.pageSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.pageNumber != null) {
      yield r'pageNumber';
      yield serializers.serialize(
        object.pageNumber,
        specifiedType: const FullType(int),
      );
    }
    if (object.paged != null) {
      yield r'paged';
      yield serializers.serialize(
        object.paged,
        specifiedType: const FullType(bool),
      );
    }
    if (object.unpaged != null) {
      yield r'unpaged';
      yield serializers.serialize(
        object.unpaged,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PageableObject object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageableObjectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.offset = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SortObject),
          ) as SortObject;
          result.sort.replace(valueDes);
          break;
        case r'pageSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageSize = valueDes;
          break;
        case r'pageNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageNumber = valueDes;
          break;
        case r'paged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.paged = valueDes;
          break;
        case r'unpaged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.unpaged = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PageableObject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageableObjectBuilder();
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

