import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.chatID,
    this.chatIndex,
  }) : super(key: key);

  final int? chatID;
  final int? chatIndex;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer2 = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          setState(() => _model.requestCompleter2 = null);
          await _model.waitForRequestCompleted2();
          setState(() => _model.requestCompleter1 = null);
          await _model.waitForRequestCompleted1();
          setState(() => _model.requestCompleter3 = null);
          await _model.waitForRequestCompleted3();
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
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

    context.watch<FFAppState>();

    return FutureBuilder<List<MessageRow>>(
      future: (_model.requestCompleter2 ??= Completer<List<MessageRow>>()
            ..complete(MessageTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'message_chat',
                    valueOrDefault<int>(
                      widget.chatID,
                      0,
                    ),
                  )
                  .order('message_sanded_at', ascending: true),
            )))
          .future,
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
        List<MessageRow> chatMessageRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 30.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('CHATS');
                },
              ),
              title: FutureBuilder<List<ChatsRow>>(
                future:
                    (_model.requestCompleter1 ??= Completer<List<ChatsRow>>()
                          ..complete(ChatsTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'chat_id',
                              widget.chatID,
                            ),
                          )))
                        .future,
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
                  List<ChatsRow> rowChatsRowList = snapshot.data!;
                  final rowChatsRow =
                      rowChatsRowList.isNotEmpty ? rowChatsRowList.first : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                FFAppState()
                                    .MAINDATA
                                    .players
                                    .where((e) =>
                                        e.playerUid ==
                                        rowChatsRow?.chatMembers
                                            ?.where((e) => e != currentUserUid)
                                            .toList()
                                            ?.first)
                                    .toList()
                                    .first
                                    .playerAvatar,
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFAppState()
                                .MAINDATA
                                .players
                                .where((e) =>
                                    e.playerUid ==
                                    rowChatsRow?.chatMembers
                                        ?.where((e) => e != currentUserUid)
                                        .toList()
                                        ?.first)
                                .toList()
                                .first
                                .playerNickname,
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          FutureBuilder<List<PlayersRow>>(
                            future: (_model.requestCompleter3 ??=
                                    Completer<List<PlayersRow>>()
                                      ..complete(PlayersTable().querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'player_uid',
                                          rowChatsRow?.chatMembers
                                              ?.where(
                                                  (e) => e != currentUserUid)
                                              .toList()
                                              ?.first,
                                        ),
                                      )))
                                .future,
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
                              List<PlayersRow> textPlayersRowList =
                                  snapshot.data!;
                              final textPlayersRow =
                                  textPlayersRowList.isNotEmpty
                                      ? textPlayersRowList.first
                                      : null;
                              return Text(
                                textPlayersRow!.playerOnline
                                    ? 'Онлайн'
                                    : 'Был в сети ${dateTimeFormat('H:mm', functions.stringDateToDateTime(textPlayersRow?.playerUpdateAt?.toString()))}',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              );
                            },
                          ),
                        ],
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  );
                },
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.restore_from_trash_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      setState(() {
                        FFAppState().messages = [];
                      });
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final messages = chatMessageRowList
                                  .sortedList((e) => e.messageSandedAt)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: messages.length,
                                itemBuilder: (context, messagesIndex) {
                                  final messagesItem = messages[messagesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState()
                                                    .MAINDATA
                                                    .chats
                                                    .where((e) =>
                                                        e.chatId ==
                                                        widget.chatID)
                                                    .toList()
                                                    .first
                                                    .chatChattype !=
                                                'Диалог')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 15.0, 0.0),
                                                child: Container(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      FFAppState()
                                                          .MAINDATA
                                                          .players
                                                          .where((e) =>
                                                              e.playerUid ==
                                                              messagesItem
                                                                  .messageSander)
                                                          .toList()
                                                          .first
                                                          .playerAvatar,
                                                      width: 45.0,
                                                      height: 5.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: messagesItem
                                                            .messageSander ==
                                                        currentUserUid
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFAppState()
                                                                  .MAINDATA
                                                                  .players
                                                                  .where((e) =>
                                                                      e.playerUid ==
                                                                      messagesItem
                                                                          .messageSander)
                                                                  .toList()
                                                                  .first
                                                                  .playerUid ==
                                                              currentUserUid
                                                          ? 'Вы'
                                                          : FFAppState()
                                                              .MAINDATA
                                                              .players
                                                              .where((e) =>
                                                                  e.playerUid ==
                                                                  messagesItem
                                                                      .messageSander)
                                                              .toList()
                                                              .first
                                                              .playerNickname,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          messagesItem
                                                              .messageBody,
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await MessageTable().insert({
                              'message_sanded_at':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'message_sander':
                                  FFAppState().AUTHPLAYER.playerUid,
                              'message_body': _model.textController.text,
                              'message_chat': widget.chatID,
                              'message_sander_avatar':
                                  FFAppState().AUTHPLAYER.playerAvatar,
                              'message_type': 'Cообщение в чате',
                            });
                            await ChatsTable().update(
                              data: {
                                'chat_updated_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'chat_last_message': _model.textController.text,
                                'chat_last_message_sander':
                                    FFAppState().AUTHPLAYER.playerUid,
                              },
                              matchingRows: (rows) => rows.eq(
                                'chat_id',
                                widget.chatID,
                              ),
                            );
                            await _model.listViewController?.animateTo(
                              0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );
                            setState(() {
                              _model.textController?.clear();
                            });
                          },
                          text: 'Отправить',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
