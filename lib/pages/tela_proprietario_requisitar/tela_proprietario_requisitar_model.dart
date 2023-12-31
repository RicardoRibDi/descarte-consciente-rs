import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'tela_proprietario_requisitar_widget.dart'
    show TelaProprietarioRequisitarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaProprietarioRequisitarModel
    extends FlutterFlowModel<TelaProprietarioRequisitarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nomeLocal widget.
  FocusNode? nomeLocalFocusNode;
  TextEditingController? nomeLocalController;
  String? Function(BuildContext, String?)? nomeLocalControllerValidator;
  // State field(s) for local widget.
  var localValue = FFPlace();
  // State field(s) for horarioAbertura widget.
  FocusNode? horarioAberturaFocusNode;
  TextEditingController? horarioAberturaController;
  final horarioAberturaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horarioAberturaControllerValidator;
  // State field(s) for horarioFechamento widget.
  FocusNode? horarioFechamentoFocusNode;
  TextEditingController? horarioFechamentoController;
  final horarioFechamentoMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horarioFechamentoControllerValidator;
  // State field(s) for CheckboxPlastico widget.
  bool? checkboxPlasticoValue;
  // State field(s) for CheckboxVidro widget.
  bool? checkboxVidroValue;
  // State field(s) for CheckboxPapel widget.
  bool? checkboxPapelValue;
  // State field(s) for CheckboxMadeira widget.
  bool? checkboxMadeiraValue;
  // State field(s) for CheckboxMetal widget.
  bool? checkboxMetalValue;
  // State field(s) for CheckboxCortante widget.
  bool? checkboxCortanteValue;
  // State field(s) for CheckboxLampada widget.
  bool? checkboxLampadaValue;
  // State field(s) for CheckboxEletronico widget.
  bool? checkboxEletronicoValue;
  // State field(s) for CheckboxBateria widget.
  bool? checkboxBateriaValue;
  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nomeLocalFocusNode?.dispose();
    nomeLocalController?.dispose();

    horarioAberturaFocusNode?.dispose();
    horarioAberturaController?.dispose();

    horarioFechamentoFocusNode?.dispose();
    horarioFechamentoController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
