import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tela_descarte_avaliar_widget.dart' show TelaDescarteAvaliarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaDescarteAvaliarModel
    extends FlutterFlowModel<TelaDescarteAvaliarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for descricaoAvaliacao widget.
  TextEditingController? descricaoAvaliacaoController;
  String? Function(BuildContext, String?)?
      descricaoAvaliacaoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    descricaoAvaliacaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
