//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'booking_dto.g.dart';

/// BookingDTO
///
/// Properties:
/// * [id] 
/// * [workspaceId] 
/// * [userId] 
/// * [bookingStart] 
/// * [bookingEnd] 
/// * [createdWhen] 
@BuiltValue()
abstract class BookingDTO implements Built<BookingDTO, BookingDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'workspaceId')
  int? get workspaceId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'bookingStart')
  DateTime? get bookingStart;

  @BuiltValueField(wireName: r'bookingEnd')
  DateTime? get bookingEnd;

  @BuiltValueField(wireName: r'createdWhen')
  DateTime? get createdWhen;

  BookingDTO._();

  factory BookingDTO([void updates(BookingDTOBuilder b)]) = _$BookingDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BookingDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BookingDTO> get serializer => _$BookingDTOSerializer();
}

class _$BookingDTOSerializer implements PrimitiveSerializer<BookingDTO> {
  @override
  final Iterable<Type> types = const [BookingDTO, _$BookingDTO];

  @override
  final String wireName = r'BookingDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BookingDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.workspaceId != null) {
      yield r'workspaceId';
      yield serializers.serialize(
        object.workspaceId,
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
    if (object.bookingStart != null) {
      yield r'bookingStart';
      yield serializers.serialize(
        object.bookingStart,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.bookingEnd != null) {
      yield r'bookingEnd';
      yield serializers.serialize(
        object.bookingEnd,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.createdWhen != null) {
      yield r'createdWhen';
      yield serializers.serialize(
        object.createdWhen,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BookingDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BookingDTOBuilder result,
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
        case r'workspaceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.workspaceId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'bookingStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.bookingStart = valueDes;
          break;
        case r'bookingEnd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.bookingEnd = valueDes;
          break;
        case r'createdWhen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdWhen = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BookingDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BookingDTOBuilder();
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

