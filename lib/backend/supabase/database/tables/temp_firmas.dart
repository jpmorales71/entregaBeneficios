import '../database.dart';

class TempFirmasTable extends SupabaseTable<TempFirmasRow> {
  @override
  String get tableName => 'temp_firmas';

  @override
  TempFirmasRow createRow(Map<String, dynamic> data) => TempFirmasRow(data);
}

class TempFirmasRow extends SupabaseDataRow {
  TempFirmasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TempFirmasTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firmaBase64 => getField<String>('firma_base64');
  set firmaBase64(String? value) => setField<String>('firma_base64', value);
}
