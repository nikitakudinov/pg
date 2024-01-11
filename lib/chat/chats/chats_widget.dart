import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  _ChatsWidgetState createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResulthok = await MessagingGroup.getuserchatsCall.call(
        authUser: currentUserUid,
      );
      if ((_model.apiResulthok?.succeeded ?? true)) {
        setState(() {
          FFAppState().updateMAINDATAStruct(
            (e) => e
              ..chats = (getJsonField(
                (_model.apiResulthok?.jsonBody ?? ''),
                r'''$[:].chats''',
                true,
              )!
                      .toList()
                      .map<ChatStruct?>(ChatStruct.maybeFromMap)
                      .toList() as Iterable<ChatStruct?>)
                  .withoutNulls
                  .toList(),
          );
        });
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

    context.watch<FFAppState>();

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
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final chatsList = FFAppState().MAINDATA.chats.toList();
                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          15.0,
                          0,
                          15.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: chatsList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 5.0),
                        itemBuilder: (context, chatsListIndex) {
                          final chatsListItem = chatsList[chatsListIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'CHAT',
                                queryParameters: {
                                  'chatID': serializeParam(
                                    chatsListItem.chatId,
                                    ParamType.int,
                                  ),
                                  'chatIndex': serializeParam(
                                    chatsListIndex,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                            FFAppState()
                                                .MAINDATA
                                                .players
                                                .where((e) =>
                                                    e.playerUid ==
                                                    chatsListItem.chatMembers
                                                        .where((e) =>
                                                            e != currentUserUid)
                                                        .toList()
                                                        .first
                                                        .playerUid)
                                                .toList()[0]
                                                .playerAvatar,
                                            width: 50.0,
                                            height: 0.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFAppState()
                                                .MAINDATA
                                                .players
                                                .where((e) =>
                                                    e.playerUid ==
                                                    chatsListItem.chatMembers
                                                        .where((e) =>
                                                            e != currentUserUid)
                                                        .toList()
                                                        .first
                                                        .playerUid)
                                                .toList()[0]
                                                .playerNickname,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                chatsListItem
                                                            .chatLastMessageSander ==
                                                        currentUserUid
                                                    ? 'Вы:'
                                                    : FFAppState()
                                                        .MAINDATA
                                                        .players
                                                        .where((e) =>
                                                            e.playerUid ==
                                                            chatsListItem
                                                                .chatLastMessageSander)
                                                        .toList()[0]
                                                        .playerNickname,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Cabin Condensed',
                                                          color:
                                                              Color(0xFF7C7D7F),
                                                        ),
                                              ),
                                              Text(
                                                chatsListItem.chatLastMessage,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          dateTimeFormat(
                                              'H m',
                                              functions.stringDateToDateTime(
                                                  chatsListItem.chatUpdatedAt)),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
