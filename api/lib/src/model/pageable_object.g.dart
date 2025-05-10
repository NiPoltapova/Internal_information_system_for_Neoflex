// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PageableObject extends PageableObject {
  @override
  final int? offset;
  @override
  final SortObject? sort;
  @override
  final int? pageSize;
  @override
  final int? pageNumber;
  @override
  final bool? paged;
  @override
  final bool? unpaged;

  factory _$PageableObject([void Function(PageableObjectBuilder)? updates]) =>
      (new PageableObjectBuilder()..update(updates))._build();

  _$PageableObject._(
      {this.offset,
      this.sort,
      this.pageSize,
      this.pageNumber,
      this.paged,
      this.unpaged})
      : super._();

  @override
  PageableObject rebuild(void Function(PageableObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageableObjectBuilder toBuilder() =>
      new PageableObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageableObject &&
        offset == other.offset &&
        sort == other.sort &&
        pageSize == other.pageSize &&
        pageNumber == other.pageNumber &&
        paged == other.paged &&
        unpaged == other.unpaged;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, pageNumber.hashCode);
    _$hash = $jc(_$hash, paged.hashCode);
    _$hash = $jc(_$hash, unpaged.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PageableObject')
          ..add('offset', offset)
          ..add('sort', sort)
          ..add('pageSize', pageSize)
          ..add('pageNumber', pageNumber)
          ..add('paged', paged)
          ..add('unpaged', unpaged))
        .toString();
  }
}

class PageableObjectBuilder
    implements Builder<PageableObject, PageableObjectBuilder> {
  _$PageableObject? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  SortObjectBuilder? _sort;
  SortObjectBuilder get sort => _$this._sort ??= new SortObjectBuilder();
  set sort(SortObjectBuilder? sort) => _$this._sort = sort;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _pageNumber;
  int? get pageNumber => _$this._pageNumber;
  set pageNumber(int? pageNumber) => _$this._pageNumber = pageNumber;

  bool? _paged;
  bool? get paged => _$this._paged;
  set paged(bool? paged) => _$this._paged = paged;

  bool? _unpaged;
  bool? get unpaged => _$this._unpaged;
  set unpaged(bool? unpaged) => _$this._unpaged = unpaged;

  PageableObjectBuilder() {
    PageableObject._defaults(this);
  }

  PageableObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _sort = $v.sort?.toBuilder();
      _pageSize = $v.pageSize;
      _pageNumber = $v.pageNumber;
      _paged = $v.paged;
      _unpaged = $v.unpaged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageableObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PageableObject;
  }

  @override
  void update(void Function(PageableObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PageableObject build() => _build();

  _$PageableObject _build() {
    _$PageableObject _$result;
    try {
      _$result = _$v ??
          new _$PageableObject._(
            offset: offset,
            sort: _sort?.build(),
            pageSize: pageSize,
            pageNumber: pageNumber,
            paged: paged,
            unpaged: unpaged,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sort';
        _sort?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PageableObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
