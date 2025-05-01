// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDTO extends UserDTO {
  @override
  final int? id;
  @override
  final String? login;
  @override
  final String? role;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final String? patronymic;
  @override
  final String? appointment;
  @override
  final Date? birthday;
  @override
  final String? avatarUrl;

  factory _$UserDTO([void Function(UserDTOBuilder)? updates]) =>
      (new UserDTOBuilder()..update(updates))._build();

  _$UserDTO._(
      {this.id,
      this.login,
      this.role,
      this.lastName,
      this.firstName,
      this.patronymic,
      this.appointment,
      this.birthday,
      this.avatarUrl})
      : super._();

  @override
  UserDTO rebuild(void Function(UserDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDTOBuilder toBuilder() => new UserDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDTO &&
        id == other.id &&
        login == other.login &&
        role == other.role &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        patronymic == other.patronymic &&
        appointment == other.appointment &&
        birthday == other.birthday &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, patronymic.hashCode);
    _$hash = $jc(_$hash, appointment.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDTO')
          ..add('id', id)
          ..add('login', login)
          ..add('role', role)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('patronymic', patronymic)
          ..add('appointment', appointment)
          ..add('birthday', birthday)
          ..add('avatarUrl', avatarUrl))
        .toString();
  }
}

class UserDTOBuilder implements Builder<UserDTO, UserDTOBuilder> {
  _$UserDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _patronymic;
  String? get patronymic => _$this._patronymic;
  set patronymic(String? patronymic) => _$this._patronymic = patronymic;

  String? _appointment;
  String? get appointment => _$this._appointment;
  set appointment(String? appointment) => _$this._appointment = appointment;

  Date? _birthday;
  Date? get birthday => _$this._birthday;
  set birthday(Date? birthday) => _$this._birthday = birthday;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  UserDTOBuilder() {
    UserDTO._defaults(this);
  }

  UserDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _login = $v.login;
      _role = $v.role;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _patronymic = $v.patronymic;
      _appointment = $v.appointment;
      _birthday = $v.birthday;
      _avatarUrl = $v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDTO;
  }

  @override
  void update(void Function(UserDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDTO build() => _build();

  _$UserDTO _build() {
    final _$result = _$v ??
        new _$UserDTO._(
          id: id,
          login: login,
          role: role,
          lastName: lastName,
          firstName: firstName,
          patronymic: patronymic,
          appointment: appointment,
          birthday: birthday,
          avatarUrl: avatarUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
