import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'direcciones_l_f',
      'direccionesLF.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<CalleSearchRow>> calleSearch({
    String? paramCalle,
  }) =>
      performCalleSearch(
        _database,
        paramCalle: paramCalle,
      );

  Future<List<BuscarNumerosPorCalleRow>> buscarNumerosPorCalle({
    String? calle,
  }) =>
      performBuscarNumerosPorCalle(
        _database,
        calle: calle,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  /// END UPDATE QUERY CALLS
}
