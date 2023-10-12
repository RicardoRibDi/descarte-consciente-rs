import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tela_principal_widget.dart' show TelaPrincipalWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaPrincipalModel extends FlutterFlowModel<TelaPrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for local widget.
  var localValue = FFPlace();
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
