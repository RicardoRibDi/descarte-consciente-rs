import '/auth/firebase_auth/auth_util.dart';
import '/components/reenviar_email/reenviar_email_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tela_de_login_widget.dart' show TelaDeLoginWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaDeLoginModel extends FlutterFlowModel<TelaDeLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)? textFieldSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldEmailFocusNode?.dispose();
    textFieldEmailController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
