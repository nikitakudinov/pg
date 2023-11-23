import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_alert_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teams_model.dart';
export 'teams_model.dart';

class TeamsWidget extends StatefulWidget {
  const TeamsWidget({Key? key}) : super(key: key);

  @override
  _TeamsWidgetState createState() => _TeamsWidgetState();
}

class _TeamsWidgetState extends State<TeamsWidget>
    with TickerProviderStateMixin {
  late TeamsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.allTeamsUpdater(context);
      await action_blocks.dowloadAllCountrieToAppState(context);
      // Загрузка и обновление notifications
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          await action_blocks.notificationsUpdater(context);
          await action_blocks.chasUpdater(context);
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
            'Команды                 ',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('TEAM_ADD');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Builder(
                    builder: (context) {
                      final notificationsList =
                          FFAppState().notofications.toList();
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(notificationsList.length,
                            (notificationsListIndex) {
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Container(
                                                    width: 20.0,
                                                    height: 12.0,
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                notificationsListItem
                                                    .notificationBody,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              await NotificationsTable().delete(
                                                matchingRows: (rows) => rows.eq(
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
                                                matchingRows: (rows) => rows.eq(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ваша команда',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                if (_model.teamActionsVISIBILITY)
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.teamActionsVISIBILITY =
                                                    false;
                                              });
                                              await showAlignedDialog(
                                                context: context,
                                                isGlobal: true,
                                                avoidOverflow: false,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child:
                                                          CustomAlertDialogWidget(
                                                        width: 200,
                                                        height: 300,
                                                        dialogBody:
                                                            'Вы уверены что хотите покинуть команду?',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            text: 'Выйти из команды',
                                            icon: Icon(
                                              Icons.person_remove_sharp,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 140.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!),
                                  ),
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      _model.teamActionsVISIBILITY = true;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        FFAppState().authPlayerTeam.teamLogo,
                                        width: 70.0,
                                        height: 70.0,
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
                                        FFAppState().authPlayerTeam.teamTag,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                      Text(
                                        FFAppState().authPlayerTeam.teamName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  FFAppState()
                                                      .authPlayerTeam
                                                      .teamFlag,
                                                  width: 20.0,
                                                  height: 12.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFAppState()
                                                .authPlayerTeam
                                                .teamCountry,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'МАТЧИ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      Row(
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
                                            '15',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ВЫЙГРАНО',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                          Text(
                                            '9',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ПРОИГРАНО',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                          Text(
                                            '6',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ТУРНИРЫ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      Row(
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
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
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
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
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
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Builder(
                    builder: (context) {
                      final allTeamsList = FFAppState().allTEAMS.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: allTeamsList.length,
                        itemBuilder: (context, allTeamsListIndex) {
                          final allTeamsListItem =
                              allTeamsList[allTeamsListIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'TEAM_VIEW',
                                queryParameters: {
                                  'teamID': serializeParam(
                                    allTeamsListItem.teamId,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            onLongPress: () async {
                              await action_blocks.loadCurentTeamMembers(
                                context,
                                selectedTeamID: allTeamsListItem.teamId,
                              );

                              context.pushNamed(
                                'TEAM_EDITE',
                                queryParameters: {
                                  'teamId': serializeParam(
                                    allTeamsListItem.teamId,
                                    ParamType.int,
                                  ),
                                  'teamIndex': serializeParam(
                                    allTeamsListIndex,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      width: 55.0,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          allTeamsListItem.teamLogo,
                                          width: 55.0,
                                          height: 55.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          allTeamsListItem.teamTag,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Text(
                                        allTeamsListItem.teamName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    allTeamsListItem.teamFlag,
                                                    width: 20.0,
                                                    height: 12.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              allTeamsListItem.teamCountry,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
