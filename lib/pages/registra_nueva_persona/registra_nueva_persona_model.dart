import '/flutter_flow/flutter_flow_util.dart';
import 'registra_nueva_persona_widget.dart' show RegistraNuevaPersonaWidget;
import 'package:flutter/material.dart';

class RegistraNuevaPersonaModel
    extends FlutterFlowModel<RegistraNuevaPersonaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for rut widget.
  FocusNode? rutFocusNode;
  TextEditingController? rutTextController;
  String? Function(BuildContext, String?)? rutTextControllerValidator;
  String? _rutTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '75u2qfgf' /* RUT is required */,
      );
    }

    return null;
  }

  // State field(s) for pasaporte widget.
  FocusNode? pasaporteFocusNode;
  TextEditingController? pasaporteTextController;
  String? Function(BuildContext, String?)? pasaporteTextControllerValidator;
  // State field(s) for nombres widget.
  FocusNode? nombresFocusNode;
  TextEditingController? nombresTextController;
  String? Function(BuildContext, String?)? nombresTextControllerValidator;
  String? _nombresTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f7f86rqd' /* Nombres is required */,
      );
    }

    return null;
  }

  // State field(s) for paterno widget.
  FocusNode? paternoFocusNode;
  TextEditingController? paternoTextController;
  String? Function(BuildContext, String?)? paternoTextControllerValidator;
  String? _paternoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2sbwjvgh' /* Paterno is required */,
      );
    }

    return null;
  }

  // State field(s) for materno widget.
  FocusNode? maternoFocusNode;
  TextEditingController? maternoTextController;
  String? Function(BuildContext, String?)? maternoTextControllerValidator;
  String? _maternoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't15m41dj' /* Materno is required */,
      );
    }

    return null;
  }

  // State field(s) for domicilio widget.
  FocusNode? domicilioFocusNode;
  TextEditingController? domicilioTextController;
  String? Function(BuildContext, String?)? domicilioTextControllerValidator;
  // State field(s) for uvecinal widget.
  FocusNode? uvecinalFocusNode;
  TextEditingController? uvecinalTextController;
  String? Function(BuildContext, String?)? uvecinalTextControllerValidator;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'syw4tcj7' /* Telefono is requerido */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tojslnf0' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    rutTextControllerValidator = _rutTextControllerValidator;
    nombresTextControllerValidator = _nombresTextControllerValidator;
    paternoTextControllerValidator = _paternoTextControllerValidator;
    maternoTextControllerValidator = _maternoTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    rutFocusNode?.dispose();
    rutTextController?.dispose();

    pasaporteFocusNode?.dispose();
    pasaporteTextController?.dispose();

    nombresFocusNode?.dispose();
    nombresTextController?.dispose();

    paternoFocusNode?.dispose();
    paternoTextController?.dispose();

    maternoFocusNode?.dispose();
    maternoTextController?.dispose();

    domicilioFocusNode?.dispose();
    domicilioTextController?.dispose();

    uvecinalFocusNode?.dispose();
    uvecinalTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
