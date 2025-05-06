import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listaMisEntregas = prefs
              .getStringList('ff_listaMisEntregas')
              ?.map((x) {
                try {
                  return MisEntregasDTStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaMisEntregas;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _firmaBase64 = '';
  String get firmaBase64 => _firmaBase64;
  set firmaBase64(String value) {
    _firmaBase64 = value;
  }

  String _firmaResponsable = '';
  String get firmaResponsable => _firmaResponsable;
  set firmaResponsable(String value) {
    _firmaResponsable = value;
  }

  String _firmaVecino = '';
  String get firmaVecino => _firmaVecino;
  set firmaVecino(String value) {
    _firmaVecino = value;
  }

  List<MisEntregasDTStruct> _listaMisEntregas = [
    MisEntregasDTStruct.fromSerializableMap(jsonDecode(
        '{\"rut\":\"11840765\",\"dv\":\"2\",\"pasaporteDni\":\"\",\"nombres\":\"Juan Pablo\",\"paterno\":\"Morales\",\"materno\":\"Abarca\",\"domicilio\":\"La Concepcion 7663\",\"unidadVecinal\":\"1\",\"block\":\"\",\"departamento\":\"\",\"telefono\":\"956593755\",\"firmaResponsable\":\"\",\"firmaVecino\":\"\",\"fechaHora\":\"1746568059716\"}'))
  ];
  List<MisEntregasDTStruct> get listaMisEntregas => _listaMisEntregas;
  set listaMisEntregas(List<MisEntregasDTStruct> value) {
    _listaMisEntregas = value;
    prefs.setStringList(
        'ff_listaMisEntregas', value.map((x) => x.serialize()).toList());
  }

  void addToListaMisEntregas(MisEntregasDTStruct value) {
    listaMisEntregas.add(value);
    prefs.setStringList('ff_listaMisEntregas',
        _listaMisEntregas.map((x) => x.serialize()).toList());
  }

  void removeFromListaMisEntregas(MisEntregasDTStruct value) {
    listaMisEntregas.remove(value);
    prefs.setStringList('ff_listaMisEntregas',
        _listaMisEntregas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaMisEntregas(int index) {
    listaMisEntregas.removeAt(index);
    prefs.setStringList('ff_listaMisEntregas',
        _listaMisEntregas.map((x) => x.serialize()).toList());
  }

  void updateListaMisEntregasAtIndex(
    int index,
    MisEntregasDTStruct Function(MisEntregasDTStruct) updateFn,
  ) {
    listaMisEntregas[index] = updateFn(_listaMisEntregas[index]);
    prefs.setStringList('ff_listaMisEntregas',
        _listaMisEntregas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaMisEntregas(int index, MisEntregasDTStruct value) {
    listaMisEntregas.insert(index, value);
    prefs.setStringList('ff_listaMisEntregas',
        _listaMisEntregas.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
