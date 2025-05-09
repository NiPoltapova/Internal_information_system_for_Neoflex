// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BookingDTO extends BookingDTO {
  @override
  final int? id;
  @override
  final int? workspaceId;
  @override
  final int? userId;
  @override
  final DateTime? bookingStart;
  @override
  final DateTime? bookingEnd;
  @override
  final DateTime? createdWhen;

  factory _$BookingDTO([void Function(BookingDTOBuilder)? updates]) =>
      (new BookingDTOBuilder()..update(updates))._build();

  _$BookingDTO._(
      {this.id,
      this.workspaceId,
      this.userId,
      this.bookingStart,
      this.bookingEnd,
      this.createdWhen})
      : super._();

  @override
  BookingDTO rebuild(void Function(BookingDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingDTOBuilder toBuilder() => new BookingDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingDTO &&
        id == other.id &&
        workspaceId == other.workspaceId &&
        userId == other.userId &&
        bookingStart == other.bookingStart &&
        bookingEnd == other.bookingEnd &&
        createdWhen == other.createdWhen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, bookingStart.hashCode);
    _$hash = $jc(_$hash, bookingEnd.hashCode);
    _$hash = $jc(_$hash, createdWhen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingDTO')
          ..add('id', id)
          ..add('workspaceId', workspaceId)
          ..add('userId', userId)
          ..add('bookingStart', bookingStart)
          ..add('bookingEnd', bookingEnd)
          ..add('createdWhen', createdWhen))
        .toString();
  }
}

class BookingDTOBuilder implements Builder<BookingDTO, BookingDTOBuilder> {
  _$BookingDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _workspaceId;
  int? get workspaceId => _$this._workspaceId;
  set workspaceId(int? workspaceId) => _$this._workspaceId = workspaceId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  DateTime? _bookingStart;
  DateTime? get bookingStart => _$this._bookingStart;
  set bookingStart(DateTime? bookingStart) =>
      _$this._bookingStart = bookingStart;

  DateTime? _bookingEnd;
  DateTime? get bookingEnd => _$this._bookingEnd;
  set bookingEnd(DateTime? bookingEnd) => _$this._bookingEnd = bookingEnd;

  DateTime? _createdWhen;
  DateTime? get createdWhen => _$this._createdWhen;
  set createdWhen(DateTime? createdWhen) => _$this._createdWhen = createdWhen;

  BookingDTOBuilder() {
    BookingDTO._defaults(this);
  }

  BookingDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _workspaceId = $v.workspaceId;
      _userId = $v.userId;
      _bookingStart = $v.bookingStart;
      _bookingEnd = $v.bookingEnd;
      _createdWhen = $v.createdWhen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingDTO;
  }

  @override
  void update(void Function(BookingDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingDTO build() => _build();

  _$BookingDTO _build() {
    final _$result = _$v ??
        new _$BookingDTO._(
          id: id,
          workspaceId: workspaceId,
          userId: userId,
          bookingStart: bookingStart,
          bookingEnd: bookingEnd,
          createdWhen: createdWhen,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
