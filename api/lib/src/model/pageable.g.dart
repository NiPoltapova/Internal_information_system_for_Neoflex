// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Pageable extends Pageable {
  @override
  final int? page;
  @override
  final int? size;
  @override
  final BuiltList<String>? sort;

  factory _$Pageable([void Function(PageableBuilder)? updates]) =>
      (new PageableBuilder()..update(updates))._build();

  _$Pageable._({this.page, this.size, this.sort}) : super._();

  @override
  Pageable rebuild(void Function(PageableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageableBuilder toBuilder() => new PageableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pageable &&
        page == other.page &&
        size == other.size &&
        sort == other.sort;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Pageable')
          ..add('page', page)
          ..add('size', size)
          ..add('sort', sort))
        .toString();
  }
}

class PageableBuilder implements Builder<Pageable, PageableBuilder> {
  _$Pageable? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  ListBuilder<String>? _sort;
  ListBuilder<String> get sort => _$this._sort ??= new ListBuilder<String>();
  set sort(ListBuilder<String>? sort) => _$this._sort = sort;

  PageableBuilder() {
    Pageable._defaults(this);
  }

  PageableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _size = $v.size;
      _sort = $v.sort?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pageable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Pageable;
  }

  @override
  void update(void Function(PageableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Pageable build() => _build();

  _$Pageable _build() {
    _$Pageable _$result;
    try {
      _$result = _$v ??
          new _$Pageable._(
            page: page,
            size: size,
            sort: _sort?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sort';
        _sort?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Pageable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
