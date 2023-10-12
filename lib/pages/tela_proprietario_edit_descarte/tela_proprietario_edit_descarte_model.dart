import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/excluir_descarte/excluir_descarte_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tela_proprietario_edit_descarte_widget.dart'
    show TelaProprietarioEditDescarteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TelaProprietarioEditDescarteModel
    extends FlutterFlowModel<TelaProprietarioEditDescarteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nomeLocal widget.
  TextEditingController? nomeLocalController1;
  String? Function(BuildContext, String?)? nomeLocalController1Validator;
  // State field(s) for nomeLocal widget.
  TextEditingController? nomeLocalController2;
  String? Function(BuildContext, String?)? nomeLocalController2Validator;
  // State field(s) for horarioAbertura widget.
  TextEditingController? horarioAberturaController;
  final horarioAberturaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horarioAberturaControllerValidator;
  // State field(s) for horarioFechamento widget.
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
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // Stores action output result for [Bottom Sheet - excluirDescarte] action in Button widget.
  bool? excluirDescarte;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nomeLocalController1?.dispose();
    nomeLocalController2?.dispose();
    horarioAberturaController?.dispose();
    horarioFechamentoController?.dispose();
    descricaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
