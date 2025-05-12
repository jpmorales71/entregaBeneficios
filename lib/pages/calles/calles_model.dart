import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'calles_widget.dart' show CallesWidget;
import 'package:flutter/material.dart';

class CallesModel extends FlutterFlowModel<CallesWidget> {
  ///  Local state fields for this page.

  String inputCalle = ' ';

  String selectedCalle = ' ';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
