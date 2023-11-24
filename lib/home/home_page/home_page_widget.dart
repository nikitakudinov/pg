import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Обновляем данные авторизитванного пользователя
      await action_blocks.authPlayerUpdater(context);
      await action_blocks.loadAuthUserChats(context);
      await action_blocks.loadALLplayers(context);
      setState(() {});
      // Загрузка и обновление notifications
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          await action_blocks.notificationsUpdater(context);
        },
        startImmediately: true,
      );
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
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.output,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                setState(() {
                  FFAppState().authPlayer = PlayerStruct();
                });
                setState(() {
                  FFAppState().authPlayerTeam = TeamStruct();
                });
                setState(() {
                  FFAppState().authUserUpdated = '0';
                });

                context.goNamedAuth('LoginPage', context.mounted);
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (FFAppState().alertsCount != 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Builder(
                      builder: (context) {
                        final notificationsList =
                            FFAppState().notofications.toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: notificationsList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, notificationsListIndex) {
                            final notificationsListItem =
                                notificationsList[notificationsListIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0x6F000000),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          notificationsListItem
                                              .notificationCreatedAt,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 45.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  () {
                                                    if (notificationsListItem
                                                            .notificationCategory ==
                                                        'От команды') {
                                                      return notificationsListItem
                                                          .notificationFromTeam
                                                          .teamLogo;
                                                    } else if (notificationsListItem
                                                            .notificationCategory ==
                                                        'От игрока') {
                                                      return notificationsListItem
                                                          .notificationFromPlayer
                                                          .playerAvatar;
                                                    } else if (notificationsListItem
                                                            .notificationCategory ==
                                                        'От турнира') {
                                                      return notificationsListItem
                                                          .notificationFromTournament
                                                          .tournamentLogo;
                                                    } else {
                                                      return '0';
                                                    }
                                                  }(),
                                                  width: 45.0,
                                                  height: 45.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                () {
                                                  if (notificationsListItem
                                                          .notificationCategory ==
                                                      'От игрока') {
                                                    return notificationsListItem
                                                        .notificationFromPlayer
                                                        .playerNickname;
                                                  } else if (notificationsListItem
                                                          .notificationCategory ==
                                                      'От команды') {
                                                    return notificationsListItem
                                                        .notificationFromTeam
                                                        .teamName;
                                                  } else if (notificationsListItem
                                                          .notificationCategory ==
                                                      'От турнира') {
                                                    return notificationsListItem
                                                        .notificationFromTournament
                                                        .tournamentName;
                                                  } else {
                                                    return '0';
                                                  }
                                                }(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 20.0,
                                                      height: 12.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          () {
                                                            if (notificationsListItem
                                                                    .notificationCategory ==
                                                                'От игрока') {
                                                              return notificationsListItem
                                                                  .notificationFromPlayer
                                                                  .playerFlag;
                                                            } else if (notificationsListItem
                                                                    .notificationCategory ==
                                                                'От команды') {
                                                              return notificationsListItem
                                                                  .notificationFromTeam
                                                                  .teamFlag;
                                                            } else if (notificationsListItem
                                                                    .notificationCategory ==
                                                                'От турнира') {
                                                              return notificationsListItem
                                                                  .notificationFromTournament
                                                                  .tournamentFlag;
                                                            } else {
                                                              return '0';
                                                            }
                                                          }(),
                                                          width: 20.0,
                                                          height: 12.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    () {
                                                      if (notificationsListItem
                                                              .notificationCategory ==
                                                          'От игрока') {
                                                        return notificationsListItem
                                                            .notificationFromPlayer
                                                            .playerCountrie;
                                                      } else if (notificationsListItem
                                                              .notificationCategory ==
                                                          'От команды') {
                                                        return notificationsListItem
                                                            .notificationFromTeam
                                                            .teamCountry;
                                                      } else if (notificationsListItem
                                                              .notificationCategory ==
                                                          'От турнира') {
                                                        return notificationsListItem
                                                            .notificationFromTournament
                                                            .tournamentCountry;
                                                      } else {
                                                        return '0';
                                                      }
                                                    }(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  notificationsListItem
                                                      .notificationBody,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (() {
                                          if (notificationsListItem
                                                  .notificationCategory ==
                                              'От игрока') {
                                            return false;
                                          } else if (notificationsListItem
                                                  .notificationCategory ==
                                              'От команды') {
                                            return true;
                                          } else if (notificationsListItem
                                                  .notificationCategory ==
                                              'От турнира') {
                                            return true;
                                          } else {
                                            return false;
                                          }
                                        }())
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await NotificationsTable()
                                                    .insert({
                                                  'notification_created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'notification_from_player':
                                                      currentUserUid,
                                                  'notification_to_player':
                                                      notificationsListItem
                                                          .notificationFromPlayer
                                                          .playerUid,
                                                  'notification_type':
                                                      'Отказ на предложение',
                                                  'notification_body':
                                                      'Игрок ${FFAppState().authPlayer.playerNickname} отказался от предложения вступить в вашу команду',
                                                  'notification_category':
                                                      'От игрока',
                                                });
                                                await NotificationsTable()
                                                    .delete(
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'notification_id',
                                                    notificationsListItem
                                                        .notificationId,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState()
                                                      .removeFromNotofications(
                                                          notificationsListItem);
                                                });
                                              },
                                              text: 'Отказаться',
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Cabin Condensed',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        if (() {
                                          if (notificationsListItem
                                                  .notificationCategory ==
                                              'От игрока') {
                                            return false;
                                          } else if (notificationsListItem
                                                  .notificationCategory ==
                                              'От команды') {
                                            return true;
                                          } else if (notificationsListItem
                                                  .notificationCategory ==
                                              'От турнира') {
                                            return true;
                                          } else {
                                            return false;
                                          }
                                        }())
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await NotificationsTable()
                                                    .insert({
                                                  'notification_created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'notification_from_player':
                                                      FFAppState()
                                                          .authPlayer
                                                          .playerUid,
                                                  'notification_to_player':
                                                      notificationsListItem
                                                          .notificationFromPlayer
                                                          .playerUid,
                                                  'notification_type':
                                                      'Принял заявку вступления в клан',
                                                  'notification_body':
                                                      'Игрок ${FFAppState().authPlayer.playerNickname}приянял приглашение вступить в команду.',
                                                  'notification_category':
                                                      'От игрока',
                                                });
                                                await PlayersTable().update(
                                                  data: {
                                                    'player_team':
                                                        notificationsListItem
                                                            .notificationFromTeam
                                                            .teamId,
                                                    'player_team_role': [
                                                      'Рядовой боец'
                                                    ],
                                                    'player_team_lineup': false,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'player_uid',
                                                    currentUserUid,
                                                  ),
                                                );
                                              },
                                              text: 'Вступить',
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Cabin Condensed',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await NotificationsTable().delete(
                                                matchingRows: (rows) => rows.eq(
                                                  'notification_id',
                                                  notificationsListItem
                                                      .notificationId,
                                                ),
                                              );
                                              setState(() {
                                                FFAppState()
                                                    .removeAtIndexFromNotofications(
                                                        notificationsListIndex);
                                              });
                                            },
                                            text: 'Ясно',
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (FFAppState().authPlayer.playerId != 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                FFAppState().authPlayer.playerAvatar,
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFAppState().authPlayer.playerNickname,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF06A502),
                                  size: 8.0,
                                ),
                              ],
                            ),
                            Text(
                              FFAppState().authUserUpdated,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              FFAppState().authPlayer.playerTag,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              FFAppState().authPlayer.playerCountrie,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: FFAppState().authPlayer.playerUid));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Скопировано',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              child: Text(
                                FFAppState().authPlayer.playerUid,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Text(
                              'Hello World',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              FFAppState().authPlayer.playerId.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              FFAppState().authPlayer.playerOnline.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ],
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
