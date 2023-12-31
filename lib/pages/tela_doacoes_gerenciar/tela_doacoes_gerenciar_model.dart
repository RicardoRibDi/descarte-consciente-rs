import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/excluir_doacao/excluir_doacao_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tela_doacoes_gerenciar_widget.dart' show TelaDoacoesGerenciarWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaDoacoesGerenciarModel
    extends FlutterFlowModel<TelaDoacoesGerenciarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - excluirDoacao] action in IconButton widget.
  bool? excluirDoacao;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
