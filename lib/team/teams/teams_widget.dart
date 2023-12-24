import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_alert_dialog/custom_alert_dialog_widget.dart';
import '/components/rating_teams_tabs_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
    'containerOnPageLoadAnimation': AnimationInfo(
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
                if (FFAppState().alertsCount != 0)
                  Padding(
                    padding: EdgeInsets.all(15.0),
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
                                color: Color(0xC5000000),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          notificationsListItem
                                              .notificationType,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                    if (notificationsListItem
                                            .notificationType !=
                                        'Матч репорт прошел модерацию')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        height: 12.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                      style:
                                                          FlutterFlowTheme.of(
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
                                                  child: Visibility(
                                                    visible: notificationsListItem
                                                            .notificationType !=
                                                        'Матч репорт',
                                                    child: Text(
                                                      notificationsListItem
                                                          .notificationBody,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                '${notificationsListItem.notificationBody}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if ((notificationsListItem
                                                .notificationType ==
                                            'Матч репорт') ||
                                        (notificationsListItem
                                                .notificationType ==
                                            'Матч репорт прошел модерацию'))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${notificationsListItem.match.matchRival1.teamName}',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Text(
                                                  '${notificationsListItem.match.matchRival1.teamTag}',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      notificationsListItem
                                                          .match
                                                          .matchRival1
                                                          .teamLogo,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    '${notificationsListItem.match.matchRival1Wins.toString()} - ${notificationsListItem.match.matchRival2Wins.toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      notificationsListItem
                                                          .match
                                                          .matchRival2
                                                          .teamLogo,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
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
                                                  '${notificationsListItem.match.matchRival2.teamName}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Text(
                                                  '${notificationsListItem.match.matchRival2.teamTag}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (notificationsListItem
                                            .notificationType ==
                                        'Матч репорт')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      'Скриншоты',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cabin Condensed',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                    ),
                                                  ),
                                                  ScreenshotsInNotificationWidget(
                                                    key: Key(
                                                        'Keyt6u_${notificationsListIndex}_of_${notificationsList.length}'),
                                                    parameter1:
                                                        notificationsListItem
                                                            .match
                                                            .matchScreenshot1,
                                                    parameter2:
                                                        notificationsListItem
                                                            .match
                                                            .matchScreenshot2,
                                                    parameter3:
                                                        notificationsListItem
                                                            .match
                                                            .matchScreenshot3,
                                                    parameter4:
                                                        notificationsListItem
                                                            .match
                                                            .matchScreenshot4,
                                                    parameter5:
                                                        notificationsListItem
                                                            .match
                                                            .matchScreenshot5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
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
                                            } else if (notificationsListItem
                                                    .notificationType ==
                                                'Матч репорт прошел модерацию') {
                                              return false;
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
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      BorderRadius.circular(
                                                          5.0),
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
                                                      'player_team_lineup':
                                                          false,
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
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                            ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
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
                                                      .removeAtIndexFromNotofications(
                                                          notificationsListIndex);
                                                  FFAppState().alertsCount = 0;
                                                });
                                              },
                                              text: 'Ясно',
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
                                          if (notificationsListItem
                                                  .notificationType ==
                                              'Матч репорт')
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  // Репорт прошел модерацию.
                                                  await NotificationsTable()
                                                      .insert({
                                                    'notification_created_at':
                                                        supaSerialize<DateTime>(
                                                            getCurrentTimestamp),
                                                    'notification_to_player':
                                                        notificationsListItem
                                                            .match
                                                            .matchReportedBy,
                                                    'notification_type':
                                                        'Матч репорт прошел модерацию',
                                                    'notification_body':
                                                        'Репорт прошел модерацию. Результаты  матча учтены в турнире.',
                                                    'notification_category':
                                                        'От турнира',
                                                    'notification_from_player':
                                                        currentUserUid,
                                                    'notification_match_id':
                                                        notificationsListItem
                                                            .match.matchId,
                                                  });
                                                  // Обновление статов соперника 1
                                                  await TeamsTable().update(
                                                    data: {
                                                      'team_matches_count':
                                                          notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchesCount +
                                                              1,
                                                      'team_match_wins': notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins <=
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins
                                                          ? notificationsListItem
                                                              .match
                                                              .matchRival1
                                                              .teamMatchWins
                                                          : (notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchWins +
                                                              1),
                                                      'team_match_loses': notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins >
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins
                                                          ? notificationsListItem
                                                              .match
                                                              .matchRival1
                                                              .teamMatchLoses
                                                          : (notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchLoses +
                                                              1),
                                                      'team_matches_rounds_count':
                                                          notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchesRoundsCount +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins,
                                                      'team_match_round_wins': notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins >
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins
                                                          ? (notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchRoundWins +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins)
                                                          : notificationsListItem
                                                              .match
                                                              .matchRival1
                                                              .teamMatchRoundWins,
                                                      'team_match_round_loses': notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins <=
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins
                                                          ? (notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamMatchRoundLoses +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins)
                                                          : notificationsListItem
                                                              .match
                                                              .matchRival1
                                                              .teamMatchRoundLoses,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'team_id',
                                                      notificationsListItem
                                                          .match
                                                          .matchRival1
                                                          .teamId,
                                                    ),
                                                  );
                                                  // Обновление статов соперника 2
                                                  await TeamsTable().update(
                                                    data: {
                                                      'team_matches_count':
                                                          notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchesCount +
                                                              1,
                                                      'team_match_wins': notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins <=
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins
                                                          ? notificationsListItem
                                                              .match
                                                              .matchRival2
                                                              .teamMatchWins
                                                          : (notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchWins +
                                                              1),
                                                      'team_match_loses': notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins >
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins
                                                          ? notificationsListItem
                                                              .match
                                                              .matchRival2
                                                              .teamMatchLoses
                                                          : (notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchLoses +
                                                              1),
                                                      'team_matches_rounds_count':
                                                          notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchesRoundsCount +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins,
                                                      'team_match_round_wins': notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins >
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins
                                                          ? (notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchRoundWins +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins)
                                                          : notificationsListItem
                                                              .match
                                                              .matchRival2
                                                              .teamMatchRoundWins,
                                                      'team_match_round_loses': notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins <=
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1Wins
                                                          ? (notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamMatchRoundLoses +
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2Wins)
                                                          : notificationsListItem
                                                              .match
                                                              .matchRival2
                                                              .teamMatchRoundLoses,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'team_id',
                                                      notificationsListItem
                                                          .match
                                                          .matchRival2
                                                          .teamId,
                                                    ),
                                                  );
                                                  _model.nextmatch =
                                                      await MatchGroup
                                                          .mATCHbyTORNandROUNDandPAIRCall
                                                          .call(
                                                    tournamentID:
                                                        notificationsListItem
                                                            .notificationFromTournament
                                                            .tournamentId,
                                                    pair: () {
                                                      if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          1) {
                                                        return 1;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          2) {
                                                        return 1;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          3) {
                                                        return 2;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          4) {
                                                        return 2;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          5) {
                                                        return 3;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          6) {
                                                        return 3;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          7) {
                                                        return 4;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          8) {
                                                        return 4;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          9) {
                                                        return 5;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          10) {
                                                        return 5;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          11) {
                                                        return 6;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          12) {
                                                        return 6;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          13) {
                                                        return 7;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          14) {
                                                        return 7;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          15) {
                                                        return 8;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentPair ==
                                                          16) {
                                                        return 8;
                                                      } else {
                                                        return 0;
                                                      }
                                                    }(),
                                                    round: () {
                                                      if (notificationsListItem
                                                              .match
                                                              .matchTournamentRound ==
                                                          1) {
                                                        return 2;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentRound ==
                                                          2) {
                                                        return 3;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentRound ==
                                                          3) {
                                                        return 4;
                                                      } else if (notificationsListItem
                                                              .match
                                                              .matchTournamentRound ==
                                                          4) {
                                                        return 5;
                                                      } else {
                                                        return 0;
                                                      }
                                                    }(),
                                                  );
                                                  if ((_model.nextmatch
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        1) {
                                                      // 1
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        2) {
                                                      // 2
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        3) {
                                                      // 3
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        4) {
                                                      // 4
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        5) {
                                                      // 5
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        6) {
                                                      // 6
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        7) {
                                                      // 7
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        8) {
                                                      // 8
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        9) {
                                                      // 9
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        10) {
                                                      // 10
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        11) {
                                                      // 11
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        12) {
                                                      // 12
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        13) {
                                                      // 13
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        14) {
                                                      // 14
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        15) {
                                                      // 15
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if (notificationsListItem
                                                            .match
                                                            .matchTournamentPair ==
                                                        16) {
                                                      // 16
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival2': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else if ((notificationsListItem
                                                                .match
                                                                .matchTournamentPair ==
                                                            1) &&
                                                        (notificationsListItem
                                                                .match
                                                                .matchTournamentRound ==
                                                            4)) {
                                                      // 15
                                                      await MatchesTable()
                                                          .update(
                                                        data: {
                                                          'match_rival1': notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins >
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins
                                                              ? notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId
                                                              : notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'match_id',
                                                          MatchGroup
                                                              .mATCHbyTORNandROUNDandPAIRCall
                                                              .matchid(
                                                            (_model.nextmatch
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?[0],
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Данные обновлены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }

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
                                                          .removeAtIndexFromNotofications(
                                                              notificationsListIndex);
                                                      FFAppState().alertsCount =
                                                          0;
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Следующий патч не определен'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Матч зачтен',
                                                options: FFButtonOptions(
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!);
                          },
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(15.0),
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
                            padding: EdgeInsets.all(10.0),
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
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                  flex: 2,
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: FFButtonWidget(
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
                                    ),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                  ],
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          'ТУРНИРЫ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '8',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '3',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '5',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          'МАТЧИ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '15',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                                              'ВЫЙГРАНО',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '9',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                                              'ПРОИГРАНО',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                            Text(
                                              '6',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
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
                ),
                wrapWithModel(
                  model: _model.ratingTeamsTabsModel,
                  updateCallback: () => setState(() {}),
                  child: RatingTeamsTabsWidget(
                    teams: FFAppState().allTEAMS,
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
