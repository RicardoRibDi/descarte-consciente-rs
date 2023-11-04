import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tela_denunciar_model.dart';
export 'tela_denunciar_model.dart';

class TelaDenunciarWidget extends StatefulWidget {
  const TelaDenunciarWidget({
    Key? key,
    required this.usuarioDenunciado,
  }) : super(key: key);

  final DocumentReference? usuarioDenunciado;

  @override
  _TelaDenunciarWidgetState createState() => _TelaDenunciarWidgetState();
}

class _TelaDenunciarWidgetState extends State<TelaDenunciarWidget> {
  late TelaDenunciarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaDenunciarModel());

    _model.textFieldController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            'Denunciar',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: Text(
                        'As informações preenchidas abaixo serão enviados para a nossa equipe para que possamos analisar o motivo da denúncia o mais rápido possível.',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 215.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: TextFormField(
                              controller: _model.textFieldController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textFieldController',
                                Duration(milliseconds: 200),
                                () => setState(() {}),
                              ),
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Informe o motivo da denúncia...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).success,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              validator: _model.textFieldControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await launchUrl(Uri(
                            scheme: 'mailto',
                            path: 'descarteconscienters.app@gmail.com',
                            query: {
                              'subject':
                                  'Denúncia - Usuário: \"${widget.usuarioDenunciado?.id}\".',
                              'body': _model.textFieldController.text,
                            }
                                .entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&')));

                        context.goNamed('telaDenunciarCompleto');
                      },
                      text: 'Enviar Denúncia',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 55.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                        elevation: 4.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
