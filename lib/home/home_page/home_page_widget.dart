import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/rating_teams_tabs_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Обновляем данные авторизитванного пользователя
      await action_blocks.authPlayerUpdater(context);
      unawaited(
        () async {
          await action_blocks.loadAuthUserChats(context);
        }(),
      );
      unawaited(
        () async {
          await action_blocks.loadAllTeamsDataToAppState(context);
        }(),
      );
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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.jsonNEWMATCHEScount =
                  await TeamGroup.uPDATEDTEAMScountCall.call(
                time: functions.timeNsecAgo(60)?.toString(),
              );
              if ((_model.jsonNEWMATCHEScount?.succeeded ?? true)) {
                if (TeamGroup.uPDATEDTEAMScountCall.count(
                      (_model.jsonNEWMATCHEScount?.jsonBody ?? ''),
                    ) !=
                    0) {
                  _model.apiResult7s1 = await TeamGroup.updatedteamsCall.call(
                    time: functions.timeNsecAgo(120)?.toString(),
                  );
                  if ((_model.apiResult7s1?.succeeded ?? true)) {
                    setState(() {
                      FFAppState().removeFromAllTEAMS(TeamStruct.maybeFromMap(
                          (_model.apiResult7s1?.jsonBody ?? ''))!);
                    });
                    await Future.delayed(const Duration(milliseconds: 1));
                    setState(() {
                      FFAppState().addToAllTEAMS(TeamStruct.maybeFromMap(
                          (_model.apiResult7s1?.jsonBody ?? ''))!);
                    });
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Обновлена команда'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              }

              setState(() {});
            },
            child: Icon(
              Icons.settings_outlined,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            valueOrDefault<String>(
              TeamGroup.uPDATEDTEAMScountCall
                  .count(
                    (_model.jsonNEWMATCHEScount?.jsonBody ?? ''),
                  )
                  .toString()
                  ?.toString(),
              '0',
            ),
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
                setState(() {
                  FFAppState().notofications = [];
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
                Stack(
                  children: [
                    if (FFAppState().authPlayer.playerId != 0)
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  FFAppState().authPlayer.playerTag,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  FFAppState().authPlayer.playerCountrie,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text:
                                            FFAppState().authPlayer.playerUid));
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
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    FFAppState().authPlayer.playerUid,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: getCurrentTimestamp.toString()));
                                  },
                                  child: Text(
                                    getCurrentTimestamp.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Text(
                                  FFAppState().authPlayer.playerId.toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  FFAppState()
                                      .authPlayer
                                      .playerOnline
                                      .toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              notificationsListItem
                                                  .notificationType,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge,
                                            ),
                                          ],
                                        ),
                                        if (notificationsListItem
                                                .notificationType !=
                                            'Матч репорт прошел модерацию')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                          FlutterFlowTheme.of(
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
                                                              child:
                                                                  Image.network(
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
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible:
                                                            notificationsListItem
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 15.0, 0.0),
                                                child: Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    '${notificationsListItem.notificationBody}',
                                                    style: FlutterFlowTheme.of(
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
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${notificationsListItem.match.matchRival1.teamName}',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Text(
                                                      '${notificationsListItem.match.matchRival1.teamTag}',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        '${notificationsListItem.match.matchRival1Wins.toString()} - ${notificationsListItem.match.matchRival2Wins.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${notificationsListItem.match.matchRival2.teamName}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Text(
                                                      '${notificationsListItem.match.matchRival2.teamTag}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                            'Key0r5_${notificationsListIndex}_of_${notificationsList.length}'),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                      FFAppState().alertsCount =
                                                          FFAppState()
                                                                  .alertsCount +
                                                              -1;
                                                    });
                                                  },
                                                  text: 'Ясно',
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Cabin Condensed',
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                          'team_updated_at':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  getCurrentTimestamp),
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
                                                          'team_updated_at':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  getCurrentTimestamp),
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
                                                      if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                          (notificationsListItem.match.matchTournamentPair ==
                                                              1)) {
                                                        // R1P1
                                                        _model.jsonR1P1 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 1,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P1
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P2
                                                        _model.jsonR1P2 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 1,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            valueOrDefault<int>(
                                                              MatchGroup
                                                                  .mATCHbyTORNandROUNDandPAIRCall
                                                                  .matchid(
                                                                (_model.jsonR1P2
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0],
                                                              0,
                                                            ),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P3
                                                        _model.jsonR1P3 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 2,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P3
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P4
                                                        _model.jsonR1P4 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 2,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            valueOrDefault<int>(
                                                              MatchGroup
                                                                  .mATCHbyTORNandROUNDandPAIRCall
                                                                  .matchid(
                                                                (_model.jsonR1P4
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0],
                                                              0,
                                                            ),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P5
                                                        _model.jsonR1P5 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 3,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            valueOrDefault<int>(
                                                              MatchGroup
                                                                  .mATCHbyTORNandROUNDandPAIRCall
                                                                  .matchid(
                                                                (_model.jsonR1P5
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0],
                                                              0,
                                                            ),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P6
                                                        _model.jsonR1P6 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 3,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P6
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P7
                                                        _model.jsonR1P7 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 4,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P7
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P8
                                                        _model.jsonR1P8 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 4,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            valueOrDefault<int>(
                                                              MatchGroup
                                                                  .mATCHbyTORNandROUNDandPAIRCall
                                                                  .matchid(
                                                                (_model.jsonR1P8
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0],
                                                              0,
                                                            ),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P9
                                                        _model.jsonR1P9 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 5,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P9
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P10
                                                        _model.jsonR1P10 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 5,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P10
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P11
                                                        _model.jsonR1P11 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 6,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P11
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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
                                                        // R1P12
                                                        _model.jsonR1P12 =
                                                            await MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .call(
                                                          tournamentID:
                                                              valueOrDefault<
                                                                  int>(
                                                            notificationsListItem
                                                                .notificationFromTournament
                                                                .tournamentId,
                                                            0,
                                                          ),
                                                          pair: 6,
                                                          round: 2,
                                                        );
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
                                                              (rows) => rows.eq(
                                                            'match_id',
                                                            MatchGroup
                                                                .mATCHbyTORNandROUNDandPAIRCall
                                                                .matchid(
                                                              (_model.jsonR1P12
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
                                                              'Данные матча обновлены',
                                                              style: TextStyle(
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

                                                      setState(() {});
                                                    },
                                                    text: 'Матч зачтен',
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!);
                              },
                            );
                          },
                        ),
                      ),
                  ],
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
