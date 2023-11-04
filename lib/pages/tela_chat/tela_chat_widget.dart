import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tela_chat_model.dart';
export 'tela_chat_model.dart';

class TelaChatWidget extends StatefulWidget {
  const TelaChatWidget({
    Key? key,
    this.chatUsuario,
    this.chatRef,
    this.nomeUsuario,
  }) : super(key: key);

  final UsuariosRecord? chatUsuario;
  final DocumentReference? chatRef;
  final String? nomeUsuario;

  @override
  _TelaChatWidgetState createState() => _TelaChatWidgetState();
}

class _TelaChatWidgetState extends State<TelaChatWidget> {
  late TelaChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUsuario == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaChatModel());

    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUsuario,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
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

    return FutureBuilder<List<ChatsRecord>>(
      future: queryChatsRecordOnce(
        queryBuilder: (chatsRecord) => chatsRecord.where(
          'users',
          arrayContains: widget.chatUsuario?.reference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ChatsRecord> telaChatChatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final telaChatChatsRecord = telaChatChatsRecordList.isNotEmpty
            ? telaChatChatsRecordList.first
            : null;
        return Scaffold(
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
                context.pop();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
            title: Text(
              widget.nomeUsuario!,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
            actions: [
              FutureBuilder<UsuariosRecord>(
                future: UsuariosRecord.getDocumentOnce(
                    telaChatChatsRecord?.userA == currentUserReference
                        ? telaChatChatsRecord!.userB!
                        : telaChatChatsRecord!.userA!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final iconButtonUsuariosRecord = snapshot.data!;
                  return FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 55.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.campaign_outlined,
                      color: FlutterFlowTheme.of(context).error,
                      size: 35.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'telaDenunciar',
                        queryParameters: {
                          'usuarioDenunciado': serializeParam(
                            iconButtonUsuariosRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: StreamBuilder<FFChatInfo>(
            stream: FFChatManager.instance.getChatInfo(
              otherUserRecord: widget.chatUsuario,
              chatReference: widget.chatRef,
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data!,
                    allowImages: false,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    otherUsersBoxDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    currentUserTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w500,
                            ),
                    otherUsersTextStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.w500,
                        ),
                    inputHintTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFDAF4FF),
                              fontSize: 0.0,
                            ),
                    inputTextStyle: FlutterFlowTheme.of(context).bodyMedium,
                  )
                : Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
