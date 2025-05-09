// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:typed_data';
import 'dart:convert';
import 'package:signature/signature.dart';

class SignatureCanvas extends StatefulWidget {
  const SignatureCanvas({
    Key? key,
    this.width,
    this.height,
    required this.accionGuardar,
    required this.accionLimpiar,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool accionGuardar;
  final bool accionLimpiar;

  @override
  _SignatureCanvasState createState() => _SignatureCanvasState();
}

class _SignatureCanvasState extends State<SignatureCanvas> {
  late SignatureController _controller;
  bool _alreadyHandledSave = false;
  bool _alreadyHandledClear = false;

  @override
  void initState() {
    super.initState();
    _controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _guardarFirma() async {
    if (_controller.isNotEmpty) {
      final Uint8List? data = await _controller.toPngBytes();
      if (data != null) {
        final base64Firma = base64Encode(data);
        FFAppState().firmaBase64 = base64Firma;
      }
    }
  }

  void _limpiarFirma() {
    _controller.clear();
    FFAppState().firmaBase64 = '';
  }

  @override
  void didUpdateWidget(covariant SignatureCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.accionGuardar && !_alreadyHandledSave) {
      _alreadyHandledSave = true;
      _guardarFirma();
    } else if (!widget.accionGuardar) {
      _alreadyHandledSave = false;
    }

    if (widget.accionLimpiar && !_alreadyHandledClear) {
      _alreadyHandledClear = true;
      _limpiarFirma();
    } else if (!widget.accionLimpiar) {
      _alreadyHandledClear = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Signature(
        controller: _controller,
        backgroundColor: Colors.white,
      ),
    );
  }
}
