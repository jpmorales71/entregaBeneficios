// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MisEntregasDTStruct extends BaseStruct {
  MisEntregasDTStruct({
    int? rut,
    String? dv,
    String? pasaporteDni,
    String? nombres,
    String? paterno,
    String? materno,
    String? domicilio,
    String? unidadVecinal,
    String? block,
    String? departamento,
    int? telefono,
    String? firmaResponsable,
    String? firmaVecino,
    DateTime? fechaHora,
  })  : _rut = rut,
        _dv = dv,
        _pasaporteDni = pasaporteDni,
        _nombres = nombres,
        _paterno = paterno,
        _materno = materno,
        _domicilio = domicilio,
        _unidadVecinal = unidadVecinal,
        _block = block,
        _departamento = departamento,
        _telefono = telefono,
        _firmaResponsable = firmaResponsable,
        _firmaVecino = firmaVecino,
        _fechaHora = fechaHora;

  // "rut" field.
  int? _rut;
  int get rut => _rut ?? 0;
  set rut(int? val) => _rut = val;

  void incrementRut(int amount) => rut = rut + amount;

  bool hasRut() => _rut != null;

  // "dv" field.
  String? _dv;
  String get dv => _dv ?? '';
  set dv(String? val) => _dv = val;

  bool hasDv() => _dv != null;

  // "pasaporteDni" field.
  String? _pasaporteDni;
  String get pasaporteDni => _pasaporteDni ?? '';
  set pasaporteDni(String? val) => _pasaporteDni = val;

  bool hasPasaporteDni() => _pasaporteDni != null;

  // "nombres" field.
  String? _nombres;
  String get nombres => _nombres ?? '';
  set nombres(String? val) => _nombres = val;

  bool hasNombres() => _nombres != null;

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

  // "domicilio" field.
  String? _domicilio;
  String get domicilio => _domicilio ?? '';
  set domicilio(String? val) => _domicilio = val;

  bool hasDomicilio() => _domicilio != null;

  // "unidadVecinal" field.
  String? _unidadVecinal;
  String get unidadVecinal => _unidadVecinal ?? '';
  set unidadVecinal(String? val) => _unidadVecinal = val;

  bool hasUnidadVecinal() => _unidadVecinal != null;

  // "block" field.
  String? _block;
  String get block => _block ?? '';
  set block(String? val) => _block = val;

  bool hasBlock() => _block != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  set departamento(String? val) => _departamento = val;

  bool hasDepartamento() => _departamento != null;

  // "telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  set telefono(int? val) => _telefono = val;

  void incrementTelefono(int amount) => telefono = telefono + amount;

  bool hasTelefono() => _telefono != null;

  // "firmaResponsable" field.
  String? _firmaResponsable;
  String get firmaResponsable => _firmaResponsable ?? '';
  set firmaResponsable(String? val) => _firmaResponsable = val;

  bool hasFirmaResponsable() => _firmaResponsable != null;

  // "firmaVecino" field.
  String? _firmaVecino;
  String get firmaVecino => _firmaVecino ?? '';
  set firmaVecino(String? val) => _firmaVecino = val;

  bool hasFirmaVecino() => _firmaVecino != null;

  // "fechaHora" field.
  DateTime? _fechaHora;
  DateTime? get fechaHora => _fechaHora;
  set fechaHora(DateTime? val) => _fechaHora = val;

  bool hasFechaHora() => _fechaHora != null;

  static MisEntregasDTStruct fromMap(Map<String, dynamic> data) =>
      MisEntregasDTStruct(
        rut: castToType<int>(data['rut']),
        dv: data['dv'] as String?,
        pasaporteDni: data['pasaporteDni'] as String?,
        nombres: data['nombres'] as String?,
        paterno: data['paterno'] as String?,
        materno: data['materno'] as String?,
        domicilio: data['domicilio'] as String?,
        unidadVecinal: data['unidadVecinal'] as String?,
        block: data['block'] as String?,
        departamento: data['departamento'] as String?,
        telefono: castToType<int>(data['telefono']),
        firmaResponsable: data['firmaResponsable'] as String?,
        firmaVecino: data['firmaVecino'] as String?,
        fechaHora: data['fechaHora'] as DateTime?,
      );

  static MisEntregasDTStruct? maybeFromMap(dynamic data) => data is Map
      ? MisEntregasDTStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rut': _rut,
        'dv': _dv,
        'pasaporteDni': _pasaporteDni,
        'nombres': _nombres,
        'paterno': _paterno,
        'materno': _materno,
        'domicilio': _domicilio,
        'unidadVecinal': _unidadVecinal,
        'block': _block,
        'departamento': _departamento,
        'telefono': _telefono,
        'firmaResponsable': _firmaResponsable,
        'firmaVecino': _firmaVecino,
        'fechaHora': _fechaHora,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rut': serializeParam(
          _rut,
          ParamType.int,
        ),
        'dv': serializeParam(
          _dv,
          ParamType.String,
        ),
        'pasaporteDni': serializeParam(
          _pasaporteDni,
          ParamType.String,
        ),
        'nombres': serializeParam(
          _nombres,
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
        'domicilio': serializeParam(
          _domicilio,
          ParamType.String,
        ),
        'unidadVecinal': serializeParam(
          _unidadVecinal,
          ParamType.String,
        ),
        'block': serializeParam(
          _block,
          ParamType.String,
        ),
        'departamento': serializeParam(
          _departamento,
          ParamType.String,
        ),
        'telefono': serializeParam(
          _telefono,
          ParamType.int,
        ),
        'firmaResponsable': serializeParam(
          _firmaResponsable,
          ParamType.String,
        ),
        'firmaVecino': serializeParam(
          _firmaVecino,
          ParamType.String,
        ),
        'fechaHora': serializeParam(
          _fechaHora,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MisEntregasDTStruct fromSerializableMap(Map<String, dynamic> data) =>
      MisEntregasDTStruct(
        rut: deserializeParam(
          data['rut'],
          ParamType.int,
          false,
        ),
        dv: deserializeParam(
          data['dv'],
          ParamType.String,
          false,
        ),
        pasaporteDni: deserializeParam(
          data['pasaporteDni'],
          ParamType.String,
          false,
        ),
        nombres: deserializeParam(
          data['nombres'],
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
        domicilio: deserializeParam(
          data['domicilio'],
          ParamType.String,
          false,
        ),
        unidadVecinal: deserializeParam(
          data['unidadVecinal'],
          ParamType.String,
          false,
        ),
        block: deserializeParam(
          data['block'],
          ParamType.String,
          false,
        ),
        departamento: deserializeParam(
          data['departamento'],
          ParamType.String,
          false,
        ),
        telefono: deserializeParam(
          data['telefono'],
          ParamType.int,
          false,
        ),
        firmaResponsable: deserializeParam(
          data['firmaResponsable'],
          ParamType.String,
          false,
        ),
        firmaVecino: deserializeParam(
          data['firmaVecino'],
          ParamType.String,
          false,
        ),
        fechaHora: deserializeParam(
          data['fechaHora'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MisEntregasDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MisEntregasDTStruct &&
        rut == other.rut &&
        dv == other.dv &&
        pasaporteDni == other.pasaporteDni &&
        nombres == other.nombres &&
        paterno == other.paterno &&
        materno == other.materno &&
        domicilio == other.domicilio &&
        unidadVecinal == other.unidadVecinal &&
        block == other.block &&
        departamento == other.departamento &&
        telefono == other.telefono &&
        firmaResponsable == other.firmaResponsable &&
        firmaVecino == other.firmaVecino &&
        fechaHora == other.fechaHora;
  }

  @override
  int get hashCode => const ListEquality().hash([
        rut,
        dv,
        pasaporteDni,
        nombres,
        paterno,
        materno,
        domicilio,
        unidadVecinal,
        block,
        departamento,
        telefono,
        firmaResponsable,
        firmaVecino,
        fechaHora
      ]);
}

MisEntregasDTStruct createMisEntregasDTStruct({
  int? rut,
  String? dv,
  String? pasaporteDni,
  String? nombres,
  String? paterno,
  String? materno,
  String? domicilio,
  String? unidadVecinal,
  String? block,
  String? departamento,
  int? telefono,
  String? firmaResponsable,
  String? firmaVecino,
  DateTime? fechaHora,
}) =>
    MisEntregasDTStruct(
      rut: rut,
      dv: dv,
      pasaporteDni: pasaporteDni,
      nombres: nombres,
      paterno: paterno,
      materno: materno,
      domicilio: domicilio,
      unidadVecinal: unidadVecinal,
      block: block,
      departamento: departamento,
      telefono: telefono,
      firmaResponsable: firmaResponsable,
      firmaVecino: firmaVecino,
      fechaHora: fechaHora,
    );
