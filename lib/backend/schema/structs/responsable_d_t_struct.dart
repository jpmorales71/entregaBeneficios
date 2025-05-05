// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsableDTStruct extends BaseStruct {
  ResponsableDTStruct({
    String? firmaResponsable,
    String? nombre,
    String? paterno,
    String? materno,
  })  : _firmaResponsable = firmaResponsable,
        _nombre = nombre,
        _paterno = paterno,
        _materno = materno;

  // "firmaResponsable" field.
  String? _firmaResponsable;
  String get firmaResponsable => _firmaResponsable ?? '';
  set firmaResponsable(String? val) => _firmaResponsable = val;

  bool hasFirmaResponsable() => _firmaResponsable != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "paterno" field.
  String? _paterno;
  String get paterno => _paterno ?? '';
  set paterno(String? val) => _paterno = val;

  bool hasPaterno() => _paterno != null;

  // "materno" field.
  String? _materno;
  String get materno => _materno ?? '';
  set materno(String? val) => _materno = val;

  bool hasMaterno() => _materno != null;

  static ResponsableDTStruct fromMap(Map<String, dynamic> data) =>
      ResponsableDTStruct(
        firmaResponsable: data['firmaResponsable'] as String?,
        nombre: data['nombre'] as String?,
        paterno: data['paterno'] as String?,
        materno: data['materno'] as String?,
      );

  static ResponsableDTStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponsableDTStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'firmaResponsable': _firmaResponsable,
        'nombre': _nombre,
        'paterno': _paterno,
        'materno': _materno,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firmaResponsable': serializeParam(
          _firmaResponsable,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'paterno': serializeParam(
          _paterno,
          ParamType.String,
        ),
        'materno': serializeParam(
          _materno,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponsableDTStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponsableDTStruct(
        firmaResponsable: deserializeParam(
          data['firmaResponsable'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        paterno: deserializeParam(
          data['paterno'],
          ParamType.String,
          false,
        ),
        materno: deserializeParam(
          data['materno'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponsableDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponsableDTStruct &&
        firmaResponsable == other.firmaResponsable &&
        nombre == other.nombre &&
        paterno == other.paterno &&
        materno == other.materno;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([firmaResponsable, nombre, paterno, materno]);
}

ResponsableDTStruct createResponsableDTStruct({
  String? firmaResponsable,
  String? nombre,
  String? paterno,
  String? materno,
}) =>
    ResponsableDTStruct(
      firmaResponsable: firmaResponsable,
      nombre: nombre,
      paterno: paterno,
      materno: materno,
    );
