//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_create_request_dto.g.dart';

/// UserCreateRequestDTO
///
/// Properties:
/// * [login] 
/// * [role] 
/// * [lastName] 
/// * [firstName] 
/// * [patronymic] 
/// * [appointment] 
/// * [birthday] 
/// * [phoneNumber] 
/// * [password] 
@BuiltValue()
abstract class UserCreateRequestDTO implements Built<UserCreateRequestDTO, UserCreateRequestDTOBuilder> {
  @BuiltValueField(wireName: r'login')
  String? get login;

  @BuiltValueField(wireName: r'role')
  String? get role;

  @BuiltValueField(wireName: r'lastName')
  String? get lastName;

  @BuiltValueField(wireName: r'firstName')
  String? get firstName;

  @BuiltValueField(wireName: r'patronymic')
  String? get patronymic;

  @BuiltValueField(wireName: r'appointment')
  String? get appointment;

  @BuiltValueField(wireName: r'birthday')
  Date? get birthday;

  @BuiltValueField(wireName: r'phoneNumber')
  String? get phoneNumber;

  @BuiltValueField(wireName: r'password')
  String? get password;

  UserCreateRequestDTO._();

  factory UserCreateRequestDTO([void updates(UserCreateRequestDTOBuilder b)]) = _$UserCreateRequestDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserCreateRequestDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserCreateRequestDTO> get serializer => _$UserCreateRequestDTOSerializer();
}

class _$UserCreateRequestDTOSerializer implements PrimitiveSerializer<UserCreateRequestDTO> {
  @override
  final Iterable<Type> types = const [UserCreateRequestDTO, _$UserCreateRequestDTO];

  @override
  final String wireName = r'UserCreateRequestDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserCreateRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.login != null) {
      yield r'login';
      yield serializers.serialize(
        object.login,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(String),
      );
    }
    if (object.lastName != null) {
      yield r'lastName';
      yield serializers.serialize(
        object.lastName,
        specifiedType: const FullType(String),
      );
    }
    if (object.firstName != null) {
      yield r'firstName';
      yield serializers.serialize(
        object.firstName,
        specifiedType: const FullType(String),
      );
    }
    if (object.patronymic != null) {
      yield r'patronymic';
      yield serializers.serialize(
        object.patronymic,
        specifiedType: const FullType(String),
      );
    }
    if (object.appointment != null) {
      yield r'appointment';
      yield serializers.serialize(
        object.appointment,
        specifiedType: const FullType(String),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType(Date),
      );
    }
    if (object.phoneNumber != null) {
      yield r'phoneNumber';
      yield serializers.serialize(
        object.phoneNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserCreateRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserCreateRequestDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'login':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.login = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
        case r'lastName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'firstName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'patronymic':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.patronymic = valueDes;
          break;
        case r'appointment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appointment = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.birthday = valueDes;
          break;
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phoneNumber = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserCreateRequestDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserCreateRequestDTOBuilder();
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

