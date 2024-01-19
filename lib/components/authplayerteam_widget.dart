import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loadingindicator_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authplayerteam_model.dart';
export 'authplayerteam_model.dart';

class AuthplayerteamWidget extends StatefulWidget {
  const AuthplayerteamWidget({Key? key}) : super(key: key);

  @override
  _AuthplayerteamWidgetState createState() => _AuthplayerteamWidgetState();
}

class _AuthplayerteamWidgetState extends State<AuthplayerteamWidget>
    with TickerProviderStateMixin {
  late AuthplayerteamModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthplayerteamModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ваша команда',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                    if (_model.teamActionslistVISIBILITY)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.jsonTEAMCHAT =
                                    await MessagingGroup.getchatbyidCall.call(
                                  chatID:
                                      FFAppState().AUTHPLAYERTEAM.teamChatId,
                                );
                                setState(() {
                                  FFAppState().STRINGARRAY = MessagingGroup
                                      .getchatbyidCall
                                      .chatmembers(
                                        (_model.jsonTEAMCHAT?.jsonBody ?? ''),
                                      )!
                                      .toList()
                                      .cast<String>();
                                });
                                setState(() {
                                  FFAppState()
                                      .removeFromSTRINGARRAY(currentUserUid);
                                });
                                await ChatsTable().update(
                                  data: {
                                    'chat_members': FFAppState().STRINGARRAY,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'chat_id',
                                    MessagingGroup.getchatbyidCall.chatid(
                                      (_model.jsonTEAMCHAT?.jsonBody ?? ''),
                                    ),
                                  ),
                                );
                                await PlayersTable().update(
                                  data: {
                                    'player_team': 0,
                                    'player_team_role': ['Вне команды'],
                                    'player_team_joined_at':
                                        getCurrentTimestamp.toString(),
                                    'player_team_lineup': false,
                                    'player_tag': 'вне команды',
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'player_uid',
                                    currentUserUid,
                                  ),
                                );
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed('HOME');

                                setState(() {
                                  FFAppState().STRINGARRAY = [];
                                });
                                setState(() {
                                  _model.teamActionslistVISIBILITY = false;
                                });

                                setState(() {});
                              },
                              text: 'Выйти из команды',
                              icon: Icon(
                                Icons.person_remove_sharp,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 140.0,
                                height: 30.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      onPressed: () async {
                        setState(() {
                          _model.teamActionslistVISIBILITY = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (FFAppState().MAINDATA.teams.length == 0)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 45.0, 0.0, 15.0),
                          child: wrapWithModel(
                            model: _model.loadingindicatorModel,
                            updateCallback: () => setState(() {}),
                            child: LoadingindicatorWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (FFAppState().MAINDATA.teams.length != 0)
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'TEAM_VIEW',
                        queryParameters: {
                          'teamID': serializeParam(
                            FFAppState().AUTHPLAYER.playerTeam,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                FFAppState().AUTHPLAYERTEAM.teamLogo,
                                width: 70.0,
                                height: 70.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'TEAM_VIEW',
                                queryParameters: {
                                  'teamID': serializeParam(
                                    FFAppState().AUTHPLAYERTEAM.teamId,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            onLongPress: () async {
                              context.pushNamed(
                                'TEAM_EDITE',
                                queryParameters: {
                                  'teamId': serializeParam(
                                    FFAppState().AUTHPLAYER.playerTeam,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    '${FFAppState().AUTHPLAYERTEAM.teamTag}',
                                    'TAG',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    '${FFAppState().AUTHPLAYERTEAM.teamName}',
                                    'Team Name',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        height: 12.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            FFAppState()
                                                .AUTHPLAYERTEAM
                                                .teamFlag,
                                            width: 20.0,
                                            height: 12.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        '${FFAppState().AUTHPLAYERTEAM.teamCountry}',
                                        'Country',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Игроки онлайн',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    Builder(
                      builder: (context) {
                        final authPlayerTeamMembersOnline = FFAppState()
                            .MAINDATA
                            .players
                            .where((e) =>
                                (e.playerTeam ==
                                    FFAppState().AUTHPLAYERTEAM.teamId) &&
                                (e.playerOnline == true))
                            .toList();
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(authPlayerTeamMembersOnline.length,
                                      (authPlayerTeamMembersOnlineIndex) {
                            final authPlayerTeamMembersOnlineItem =
                                authPlayerTeamMembersOnline[
                                    authPlayerTeamMembersOnlineIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 8.0,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'PLAYER-VIEW',
                                      queryParameters: {
                                        'playerId': serializeParam(
                                          authPlayerTeamMembersOnlineItem
                                              .playerId,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    authPlayerTeamMembersOnlineItem
                                        .playerNickname,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ].divide(SizedBox(width: 3.0)),
                            );
                          })
                                  .divide(SizedBox(width: 5.0))
                                  .addToStart(SizedBox(width: 10.0)),
                        );
                      },
                    ),
                  ]
                      .addToStart(SizedBox(width: 15.0))
                      .addToEnd(SizedBox(width: 15.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'CHAT',
                          queryParameters: {
                            'chatID': serializeParam(
                              FFAppState().AUTHPLAYERTEAM.teamChatId,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'В чат команды',
                      icon: Icon(
                        Icons.groups,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 140.0,
                        height: 30.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context).bodySmall,
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('RTPAGE');
                      },
                      text: 'В чат с лидером',
                      icon: FaIcon(
                        FontAwesomeIcons.chessKing,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 140.0,
                        height: 30.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context).bodySmall,
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              if (FFAppState().MAINDATA.teams.length != 0)
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  'ТУРНИРЫ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ВСЕГО',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    '8',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'АКТИВНЫХ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    '3',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ЗАВЕРШЕН.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    '5',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  'МАТЧИ',
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ВСЕГО',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      '${FFAppState().AUTHPLAYERTEAM.teamMatchesCount.toString()}',
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ПОБЕДЫ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    '${FFAppState().AUTHPLAYERTEAM.teamMatchWins.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ПОРАЖЕНИЯ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      '${FFAppState().AUTHPLAYERTEAM.teamMatchLoses.toString()}',
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
