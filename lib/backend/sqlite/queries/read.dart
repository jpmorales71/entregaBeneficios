import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN CALLESEARCH
Future<List<CalleSearchRow>> performCalleSearch(
  Database database, {
  String? paramCalle,
}) {
  final query = '''
SELECT DISTINCT CALLE
FROM GEOM_MAESTRA_PREDIOS_POINT
WHERE CALLE LIKE '%${paramCalle}%'
ORDER BY CALLE ASC;
''';
  return _readQuery(database, query, (d) => CalleSearchRow(d));
}

class CalleSearchRow extends SqliteRow {
  CalleSearchRow(Map<String, dynamic> data) : super(data);

  int get objectid => data['OBJECTID'] as int;
  String? get calle => data['CALLE'] as String?;
  String? get numero => data['NUMERO'] as String?;
}

/// END CALLESEARCH

/// BEGIN BUSCARNUMEROSPORCALLE
Future<List<BuscarNumerosPorCalleRow>> performBuscarNumerosPorCalle(
  Database database, {
  String? calle,
}) {
  final query = '''
SELECT DISTINCT NUMERO
FROM GEOM_MAESTRA_PREDIOS_POINT
WHERE CALLE = '%${calle}%'
ORDER BY NUMERO;

''';
  return _readQuery(database, query, (d) => BuscarNumerosPorCalleRow(d));
}

class BuscarNumerosPorCalleRow extends SqliteRow {
  BuscarNumerosPorCalleRow(Map<String, dynamic> data) : super(data);

  String? get numero => data['NUMERO'] as String?;
  String? get calle => data['CALLE'] as String?;
}

/// END BUSCARNUMEROSPORCALLE
