import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'tela_de_cadastro_widget.dart' show TelaDeCadastroWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TelaDeCadastroModel extends FlutterFlowModel<TelaDeCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneController;
  final telefoneMask = MaskTextInputFormatter(mask: '+55 (##) #####-####');
  String? Function(BuildContext, String?)? telefoneControllerValidator;
  // State field(s) for local widget.
  var localValue = FFPlace();
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for confirmarSenha widget.
  FocusNode? confirmarSenhaFocusNode;
  TextEditingController? confirmarSenhaController;
  late bool confirmarSenhaVisibility;
  String? Function(BuildContext, String?)? confirmarSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
    confirmarSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();

    confirmarSenhaFocusNode?.dispose();
    confirmarSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
