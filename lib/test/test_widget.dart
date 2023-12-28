import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loadingindicator_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().updateVISIBILITYStruct(
          (e) => e..loadingIndicator = true,
        );
      });
      unawaited(
        () async {
          await action_blocks.teamsloader(context);
          setState(() {});
        }(),
      );
      unawaited(
        () async {
          await action_blocks.matchesloader(context);
          setState(() {});
        }(),
      );
      unawaited(
        () async {
          await action_blocks.tournamentsloader(context);
          setState(() {});
        }(),
      );
      await action_blocks.authplayerloader(context);
      setState(() {});
      FFAppState().updateVISIBILITYStruct(
        (e) => e..loadingIndicator = false,
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 2000),
        callback: (timer) async {
          unawaited(
            () async {
              await action_blocks.notificationsupdater(context);
            }(),
          );
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
            Visibility(
              visible: FFAppState().MAINDATA.teams.length == 0,
              child: wrapWithModel(
                model: _model.loadingindicatorModel,
                updateCallback: () => setState(() {}),
                child: LoadingindicatorWidget(),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'ТУРНИРЫ',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final tournamentsList = FFAppState()
                                        .MAINDATA
                                        .tournaments
                                        .toList()
                                        .take(1)
                                        .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        15.0,
                                        0,
                                        0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: tournamentsList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 5.0),
                                      itemBuilder:
                                          (context, tournamentsListIndex) {
                                        final tournamentsListItem =
                                            tournamentsList[
                                                tournamentsListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'TEST2',
                                              queryParameters: {
                                                'tournamentId': serializeParam(
                                                  tournamentsListItem
                                                      .tournamentId,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: VlistITEMWidget(
                                            key: Key(
                                                'Keyfx4_${tournamentsListIndex}_of_${tournamentsList.length}'),
                                            imageSize: 50,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            title: tournamentsListItem
                                                .tournamentTag,
                                            subtitle: tournamentsListItem
                                                .tournamentName,
                                            image: tournamentsListItem
                                                .tournamentLogo,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Общая статистика',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Всего турниров',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Всего матчей',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Всего команд',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          FFAppState()
                                              .MAINDATA
                                              .authplayer[0]
                                              .playerNickname,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFAppState()
                                              .MAINDATA
                                              .tournaments
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          FFAppState()
                                              .MAINDATA
                                              .matches
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          FFAppState()
                                              .MAINDATA
                                              .teams
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (FFAppState().MAINDATA.notifications.length != 0)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Builder(
                              builder: (context) {
                                final notificationsList = FFAppState()
                                    .MAINDATA
                                    .notifications
                                    .toList();
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: notificationsList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder:
                                      (context, notificationsListIndex) {
                                    final notificationsListItem =
                                        notificationsList[
                                            notificationsListIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xC5000000),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  notificationsListItem
                                                      .notificationType,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ],
                                            ),
                                            if (notificationsListItem
                                                    .notificationType !=
                                                'Матч репорт прошел модерацию')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
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
                                                                    height:
                                                                        12.0,
                                                                    fit: BoxFit
                                                                        .cover,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: notificationsListItem
                                                                    .notificationType !=
                                                                'Матч репорт',
                                                            child: Text(
                                                              notificationsListItem
                                                                  .notificationBody,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Container(
                                                      width: 300.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        '${notificationsListItem.notificationBody}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          '${notificationsListItem.match.matchRival1.teamName}',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '${notificationsListItem.match.matchRival1.teamTag}',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            '${notificationsListItem.match.matchRival1Wins.toString()} - ${notificationsListItem.match.matchRival2Wins.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${notificationsListItem.match.matchRival2.teamName}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '${notificationsListItem.match.matchRival2.teamTag}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              'Скриншоты',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                'Keyg1h_${notificationsListIndex}_of_${notificationsList.length}'),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                                supaSerialize<
                                                                        DateTime>(
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
                                                            matchingRows:
                                                                (rows) =>
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
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cabin Condensed',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                                supaSerialize<
                                                                        DateTime>(
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
                                                          await PlayersTable()
                                                              .update(
                                                            data: {
                                                              'player_team':
                                                                  notificationsListItem
                                                                      .notificationFromTeam
                                                                      .teamId,
                                                              'player_team_role':
                                                                  [
                                                                'Рядовой боец'
                                                              ],
                                                              'player_team_lineup':
                                                                  false,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'player_uid',
                                                              currentUserUid,
                                                            ),
                                                          );
                                                        },
                                                        text: 'Вступить',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cabin Condensed',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await NotificationsTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'notification_id',
                                                            notificationsListItem
                                                                .notificationId,
                                                          ),
                                                        );
                                                        setState(() {
                                                          FFAppState()
                                                              .updateMAINDATAStruct(
                                                            (e) => e
                                                              ..updateNotifications(
                                                                (e) => e.removeAt(
                                                                    notificationsListIndex),
                                                              ),
                                                          );
                                                        });
                                                      },
                                                      text: 'Ясно',
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Cabin Condensed',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
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
                                                                supaSerialize<
                                                                        DateTime>(
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
                                                                    .match
                                                                    .matchId,
                                                          });
                                                          // Обновление статов соперника 1
                                                          await TeamsTable()
                                                              .update(
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
                                                              'team_matches_rounds_count': notificationsListItem
                                                                      .match
                                                                      .matchRival1
                                                                      .teamMatchesRoundsCount +
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins +
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins,
                                                              'team_match_round_wins': notificationsListItem.match.matchRival1Wins > notificationsListItem.match.matchRival2Wins
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
                                                              'team_match_round_loses': notificationsListItem.match.matchRival1Wins <= notificationsListItem.match.matchRival2Wins
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
                                                              'team_updated_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'team_id',
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival1
                                                                  .teamId,
                                                            ),
                                                          );
                                                          // Обновление статов соперника 2
                                                          await TeamsTable()
                                                              .update(
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
                                                              'team_matches_rounds_count': notificationsListItem
                                                                      .match
                                                                      .matchRival2
                                                                      .teamMatchesRoundsCount +
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival2Wins +
                                                                  notificationsListItem
                                                                      .match
                                                                      .matchRival1Wins,
                                                              'team_match_round_wins': notificationsListItem.match.matchRival2Wins > notificationsListItem.match.matchRival1Wins
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
                                                              'team_match_round_loses': notificationsListItem.match.matchRival2Wins <= notificationsListItem.match.matchRival1Wins
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
                                                              'team_updated_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'team_id',
                                                              notificationsListItem
                                                                  .match
                                                                  .matchRival2
                                                                  .teamId,
                                                            ),
                                                          );
                                                          if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  1)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  2)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  3)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  4)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  5)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        3,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  6)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        3,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  7)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        4,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  8)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        4,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  9)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        5,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem
                                                                      .match
                                                                      .matchTournamentPair ==
                                                                  10)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        5,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                              (notificationsListItem.match.matchTournamentPair == 11)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        6,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 12)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        6,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 13)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        7,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 14)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        7,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 15)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        8,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 16)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        2,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        8,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 3)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 4)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 5)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        3,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 6)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        3,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 7)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        4,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 8)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        3,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        4,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        4,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        4,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 3)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        4,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 4)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        4,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 4) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        5,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival1':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchLooser,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        5,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else if ((notificationsListItem.match.matchTournamentRound == 4) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchWinner,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        5,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        1,
                                                                      ),
                                                            );
                                                            await MatchesTable()
                                                                .update(
                                                              data: {
                                                                'match_rival2':
                                                                    notificationsListItem
                                                                        .match
                                                                        .matchLooser,
                                                                'match_updateted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eq(
                                                                        'match_for_tournament',
                                                                        notificationsListItem
                                                                            .notificationFromTournament
                                                                            .tournamentId,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_round',
                                                                        5,
                                                                      )
                                                                      .eq(
                                                                        'match_tournament_pair',
                                                                        2,
                                                                      ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Данные матча обновлены',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          await NotificationsTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'notification_id',
                                                              notificationsListItem
                                                                  .notificationId,
                                                            ),
                                                          );
                                                          setState(() {
                                                            FFAppState()
                                                                .updateMAINDATAStruct(
                                                              (e) => e
                                                                ..updateNotifications(
                                                                  (e) => e.removeAt(
                                                                      notificationsListIndex),
                                                                ),
                                                            );
                                                          });
                                                        },
                                                        text: 'Матч зачтен',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cabin Condensed',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
