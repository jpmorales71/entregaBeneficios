import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN ALLDIRECCIONES
Future<List<AllDireccionesRow>> performAllDirecciones(
  Database database,
) {
  final query = '''
SELECT * FROM GEOM_MAESTRA_PREDIOS_POINT;
''';
  return _readQuery(database, query, (d) => AllDireccionesRow(d));
}

class AllDireccionesRow extends SqliteRow {
  AllDireccionesRow(Map<String, dynamic> data) : super(data);

  int get objectid => data['objectid'] as int;
  String get calle => data['calle'] as String;
  String get numero => data['numero'] as String;
  String get aclaratoria => data['aclaratoria'] as String;
  double get xLatitud => data['x_latitud'] as double;
  double get yLongitud => data['y_longitud'] as double;
}

/// END ALLDIRECCIONES

/// BEGIN READ DIRECCIONESSEARCH
Future<List<ReadDireccionesSEARCHRow>> performReadDireccionesSEARCH(
  Database database, {
  String? paramCalle,
}) {
  final query = '''
SELECT * FROM GEOM_MAESTRA_PREDIOS_POINT where calle like '%${paramCalle}%'
''';
  return _readQuery(database, query, (d) => ReadDireccionesSEARCHRow(d));
}

class ReadDireccionesSEARCHRow extends SqliteRow {
  ReadDireccionesSEARCHRow(Map<String, dynamic> data) : super(data);

  int get objectid => data['objectid'] as int;
  String get calle => data['calle'] as String;
  String get numero => data['numero'] as String;
  String get aclaratoria => data['aclaratoria'] as String;
  double get xLatitud => data['x_latitud'] as double;
  double get yLongitud => data['y_longitud'] as double;
}

/// END READ DIRECCIONESSEARCH
