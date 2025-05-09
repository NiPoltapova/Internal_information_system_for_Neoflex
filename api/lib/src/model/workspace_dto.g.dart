// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceDTO extends WorkspaceDTO {
  @override
  final int? id;
  @override
  final bool? available;

  factory _$WorkspaceDTO([void Function(WorkspaceDTOBuilder)? updates]) =>
      (new WorkspaceDTOBuilder()..update(updates))._build();

  _$WorkspaceDTO._({this.id, this.available}) : super._();

  @override
  WorkspaceDTO rebuild(void Function(WorkspaceDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceDTOBuilder toBuilder() => new WorkspaceDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceDTO &&
        id == other.id &&
        available == other.available;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, available.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspaceDTO')
          ..add('id', id)
          ..add('available', available))
        .toString();
  }
}

class WorkspaceDTOBuilder
    implements Builder<WorkspaceDTO, WorkspaceDTOBuilder> {
  _$WorkspaceDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _available;
  bool? get available => _$this._available;
  set available(bool? available) => _$this._available = available;

  WorkspaceDTOBuilder() {
    WorkspaceDTO._defaults(this);
  }

  WorkspaceDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _available = $v.available;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceDTO;
  }

  @override
  void update(void Function(WorkspaceDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceDTO build() => _build();

  _$WorkspaceDTO _build() {
    final _$result = _$v ??
        new _$WorkspaceDTO._(
          id: id,
          available: available,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
