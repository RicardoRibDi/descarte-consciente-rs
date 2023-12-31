import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tela_doacoes_cadastro_widget.dart' show TelaDoacoesCadastroWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaDoacoesCadastroModel
    extends FlutterFlowModel<TelaDoacoesCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nomeDoItem widget.
  FocusNode? nomeDoItemFocusNode;
  TextEditingController? nomeDoItemController;
  String? Function(BuildContext, String?)? nomeDoItemControllerValidator;
  // State field(s) for descricaoDoItem widget.
  FocusNode? descricaoDoItemFocusNode;
  TextEditingController? descricaoDoItemController;
  String? Function(BuildContext, String?)? descricaoDoItemControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nomeDoItemFocusNode?.dispose();
    nomeDoItemController?.dispose();

    descricaoDoItemFocusNode?.dispose();
    descricaoDoItemController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
