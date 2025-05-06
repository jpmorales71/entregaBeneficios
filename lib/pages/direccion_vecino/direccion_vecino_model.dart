import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'direccion_vecino_widget.dart' show DireccionVecinoWidget;
import 'package:flutter/material.dart';

class DireccionVecinoModel extends FlutterFlowModel<DireccionVecinoWidget> {
  ///  Local state fields for this page.

  String? direccion;

  int? numero;

  String? latitud;

  String? longitud;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
