import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lista_vazia_doacao_model.dart';
export 'lista_vazia_doacao_model.dart';

class ListaVaziaDoacaoWidget extends StatefulWidget {
  const ListaVaziaDoacaoWidget({Key? key}) : super(key: key);

  @override
  _ListaVaziaDoacaoWidgetState createState() => _ListaVaziaDoacaoWidgetState();
}

class _ListaVaziaDoacaoWidgetState extends State<ListaVaziaDoacaoWidget> {
  late ListaVaziaDoacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaVaziaDoacaoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lista vazia',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Parece que não há doações no momento.\n:(',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
