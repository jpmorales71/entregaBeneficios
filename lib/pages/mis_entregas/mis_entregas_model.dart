import '/flutter_flow/flutter_flow_util.dart';
import 'mis_entregas_widget.dart' show MisEntregasWidget;
import 'package:flutter/material.dart';

class MisEntregasModel extends FlutterFlowModel<MisEntregasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
