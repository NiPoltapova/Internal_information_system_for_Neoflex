// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_chat_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PageChatSummaryDTO extends PageChatSummaryDTO {
  @override
  final int? totalElements;
  @override
  final int? totalPages;
  @override
  final bool? first;
  @override
  final bool? last;
  @override
  final int? size;
  @override
  final BuiltList<ChatSummaryDTO>? content;
  @override
  final int? number;
  @override
  final SortObject? sort;
  @override
  final int? numberOfElements;
  @override
  final PageableObject? pageable;
  @override
  final bool? empty;

  factory _$PageChatSummaryDTO(
          [void Function(PageChatSummaryDTOBuilder)? updates]) =>
      (new PageChatSummaryDTOBuilder()..update(updates))._build();

  _$PageChatSummaryDTO._(
      {this.totalElements,
      this.totalPages,
      this.first,
      this.last,
      this.size,
      this.content,
      this.number,
      this.sort,
      this.numberOfElements,
      this.pageable,
      this.empty})
      : super._();

  @override
  PageChatSummaryDTO rebuild(
          void Function(PageChatSummaryDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageChatSummaryDTOBuilder toBuilder() =>
      new PageChatSummaryDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageChatSummaryDTO &&
        totalElements == other.totalElements &&
        totalPages == other.totalPages &&
        first == other.first &&
        last == other.last &&
        size == other.size &&
        content == other.content &&
        number == other.number &&
        sort == other.sort &&
        numberOfElements == other.numberOfElements &&
        pageable == other.pageable &&
        empty == other.empty;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalElements.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jc(_$hash, last.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, numberOfElements.hashCode);
    _$hash = $jc(_$hash, pageable.hashCode);
    _$hash = $jc(_$hash, empty.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PageChatSummaryDTO')
          ..add('totalElements', totalElements)
          ..add('totalPages', totalPages)
          ..add('first', first)
          ..add('last', last)
          ..add('size', size)
          ..add('content', content)
          ..add('number', number)
          ..add('sort', sort)
          ..add('numberOfElements', numberOfElements)
          ..add('pageable', pageable)
          ..add('empty', empty))
        .toString();
  }
}

class PageChatSummaryDTOBuilder
    implements Builder<PageChatSummaryDTO, PageChatSummaryDTOBuilder> {
  _$PageChatSummaryDTO? _$v;

  int? _totalElements;
  int? get totalElements => _$this._totalElements;
  set totalElements(int? totalElements) =>
      _$this._totalElements = totalElements;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  bool? _first;
  bool? get first => _$this._first;
  set first(bool? first) => _$this._first = first;

  bool? _last;
  bool? get last => _$this._last;
  set last(bool? last) => _$this._last = last;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  ListBuilder<ChatSummaryDTO>? _content;
  ListBuilder<ChatSummaryDTO> get content =>
      _$this._content ??= new ListBuilder<ChatSummaryDTO>();
  set content(ListBuilder<ChatSummaryDTO>? content) =>
      _$this._content = content;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  SortObjectBuilder? _sort;
  SortObjectBuilder get sort => _$this._sort ??= new SortObjectBuilder();
  set sort(SortObjectBuilder? sort) => _$this._sort = sort;

  int? _numberOfElements;
  int? get numberOfElements => _$this._numberOfElements;
  set numberOfElements(int? numberOfElements) =>
      _$this._numberOfElements = numberOfElements;

  PageableObjectBuilder? _pageable;
  PageableObjectBuilder get pageable =>
      _$this._pageable ??= new PageableObjectBuilder();
  set pageable(PageableObjectBuilder? pageable) => _$this._pageable = pageable;

  bool? _empty;
  bool? get empty => _$this._empty;
  set empty(bool? empty) => _$this._empty = empty;

  PageChatSummaryDTOBuilder() {
    PageChatSummaryDTO._defaults(this);
  }

  PageChatSummaryDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalElements = $v.totalElements;
      _totalPages = $v.totalPages;
      _first = $v.first;
      _last = $v.last;
      _size = $v.size;
      _content = $v.content?.toBuilder();
      _number = $v.number;
      _sort = $v.sort?.toBuilder();
      _numberOfElements = $v.numberOfElements;
      _pageable = $v.pageable?.toBuilder();
      _empty = $v.empty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageChatSummaryDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PageChatSummaryDTO;
  }

  @override
  void update(void Function(PageChatSummaryDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PageChatSummaryDTO build() => _build();

  _$PageChatSummaryDTO _build() {
    _$PageChatSummaryDTO _$result;
    try {
      _$result = _$v ??
          new _$PageChatSummaryDTO._(
            totalElements: totalElements,
            totalPages: totalPages,
            first: first,
            last: last,
            size: size,
            content: _content?.build(),
            number: number,
            sort: _sort?.build(),
            numberOfElements: numberOfElements,
            pageable: _pageable?.build(),
            empty: empty,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        _content?.build();

        _$failedField = 'sort';
        _sort?.build();

        _$failedField = 'pageable';
        _pageable?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PageChatSummaryDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
