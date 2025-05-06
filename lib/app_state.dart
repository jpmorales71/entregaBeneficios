import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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
}
