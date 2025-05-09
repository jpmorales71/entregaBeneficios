import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'mapa_cuadrante_model.dart';
export 'mapa_cuadrante_model.dart';

class MapaCuadranteWidget extends StatefulWidget {
  const MapaCuadranteWidget({super.key});

  @override
  State<MapaCuadranteWidget> createState() => _MapaCuadranteWidgetState();
}

class _MapaCuadranteWidgetState extends State<MapaCuadranteWidget> {
  late MapaCuadranteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaCuadranteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 3000),
                  fadeOutDuration: Duration(milliseconds: 3000),
                  imageUrl:
                      'https://appx.laflorida.cl/app_gas/cuadrantes/1/UV_1_C1.jpg',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'imageTag',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'imageTag',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 3000),
              fadeOutDuration: Duration(milliseconds: 3000),
              imageUrl:
                  'https://appx.laflorida.cl/app_gas/cuadrantes/1/UV_1_C1.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
