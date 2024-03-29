import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/authplayerteam_widget.dart';
import '/components/loadingindicator_widget.dart';
import '/components/rating_teams_tabs_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.authplayerloader(context);
      await action_blocks.maindataloader(context);
      setState(() {});
      setState(() {
        FFAppState().AUTHPLAYERTEAM = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == FFAppState().AUTHPLAYER.playerTeam)
            .toList()
            .first;
      });
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 2000),
        callback: (timer) async {
          unawaited(
            () async {
              await action_blocks.notificationsupdater(context);
            }(),
          );
          await PlayersTable().update(
            data: {
              'player_online': true,
              'player_update_at': supaSerialize<DateTime>(getCurrentTimestamp),
            },
            matchingRows: (rows) => rows.eq(
              'player_uid',
              currentUserUid,
            ),
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto Condensed',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.security_update_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await launchURL(
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/updateApp.apk?t=2024-01-02T10%3A10%3A48.382Z');
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.kuserAdd,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('TEAMADD2');
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.klogIn,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  setState(() {
                    FFAppState().MAINDATA = MaindataStruct();
                    FFAppState().AUTHPLAYER = PlayerStruct();
                    FFAppState().AUTHPLAYERTEAM = TeamStruct();
                  });

                  context.goNamedAuth('LoginPage', context.mounted);
                },
              ),
            ],
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
                          if (FFAppState().AUTHPLAYER.playerNickname != null &&
                              FFAppState().AUTHPLAYER.playerNickname != '')
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.network(
                                          FFAppState().AUTHPLAYER.playerAvatar,
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState()
                                                    .AUTHPLAYER
                                                    .playerTeam !=
                                                0)
                                              Text(
                                                FFAppState()
                                                    .AUTHPLAYER
                                                    .playerTag,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                              ),
                                            Text(
                                              FFAppState()
                                                  .AUTHPLAYER
                                                  .playerNickname,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                        Text(
                                          FFAppState()
                                              .AUTHPLAYER
                                              .playerTeamRole
                                              .take(5)
                                              .toList()
                                              .first,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Container(
                                                width: 20.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    FFAppState()
                                                        .AUTHPLAYER
                                                        .playerFlag,
                                                    width: 20.0,
                                                    height: 12.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFAppState()
                                                  .AUTHPLAYER
                                                  .playerCountrie,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          if (FFAppState().AUTHPLAYER.playerTeam != 0)
                            wrapWithModel(
                              model: _model.authplayerteamModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: AuthplayerteamWidget(),
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
                                        .take(5)
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
                                              'TOURNAMENT_VIEW2',
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
                                            country: tournamentsListItem
                                                .tournamentCountry,
                                            flag: tournamentsListItem
                                                .tournamentFlag,
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
                                          'Всего чатов',
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
                                        Text(
                                          FFAppState()
                                              .MAINDATA
                                              .chats
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
                          wrapWithModel(
                            model: _model.ratingTeamsTabsModel,
                            updateCallback: () => setState(() {}),
                            child: RatingTeamsTabsWidget(
                              teams: FFAppState().MAINDATA.teams,
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
                                      constraints: BoxConstraints(
                                        maxWidth: 550.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xC5000000),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
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
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
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
                                                          if (FFAppState()
                                                                  .AUTHPLAYER
                                                                  .playerTeam ==
                                                              0) {
                                                            await NotificationsTable()
                                                                .insert({
                                                              'notification_created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'notification_from_player':
                                                                  FFAppState()
                                                                      .AUTHPLAYER
                                                                      .playerUid,
                                                              'notification_to_player':
                                                                  notificationsListItem
                                                                      .notificationFromPlayer
                                                                      .playerUid,
                                                              'notification_type':
                                                                  'Принял заявку вступления в клан',
                                                              'notification_body':
                                                                  'Игрок ${FFAppState().AUTHPLAYER.playerNickname}приянял приглашение вступить в команду.',
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
                                                                'player_tag':
                                                                    notificationsListItem
                                                                        .notificationFromTeam
                                                                        .teamTag,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'player_uid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            _model.jsonTEAMCHATold =
                                                                await MessagingGroup
                                                                    .getchatbyidCall
                                                                    .call(
                                                              chatID: FFAppState()
                                                                  .AUTHPLAYERTEAM
                                                                  .teamChatId,
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                      .STRINGARRAY =
                                                                  MessagingGroup
                                                                      .getchatbyidCall
                                                                      .chatmembers(
                                                                        (_model.jsonTEAMCHATold?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .removeFromSTRINGARRAY(
                                                                      currentUserUid);
                                                            });
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'chat_members':
                                                                    FFAppState()
                                                                        .STRINGARRAY,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'chat_id',
                                                                FFAppState()
                                                                    .AUTHPLAYERTEAM
                                                                    .teamChatId,
                                                              ),
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                  .STRINGARRAY = [];
                                                            });
                                                            _model.jsonTEAMCHAT =
                                                                await MessagingGroup
                                                                    .getchatbyidCall
                                                                    .call(
                                                              chatID: notificationsListItem
                                                                  .notificationFromTeam
                                                                  .teamChatId,
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                      .STRINGARRAY =
                                                                  MessagingGroup
                                                                      .getchatbyidCall
                                                                      .chatmembers(
                                                                        (_model.jsonTEAMCHAT?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToSTRINGARRAY(
                                                                      currentUserUid);
                                                            });
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'chat_members':
                                                                    FFAppState()
                                                                        .STRINGARRAY,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'chat_id',
                                                                MessagingGroup
                                                                    .getchatbyidCall
                                                                    .chatid(
                                                                  (_model.jsonTEAMCHAT
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              ),
                                                            );
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
                                                                    (e) => e.remove(
                                                                        notificationsListItem),
                                                                  ),
                                                              );
                                                              FFAppState()
                                                                  .STRINGARRAY = [];
                                                            });

                                                            context.pushNamed(
                                                                'HOME');
                                                          } else {
                                                            await NotificationsTable()
                                                                .insert({
                                                              'notification_created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                              'notification_from_player':
                                                                  FFAppState()
                                                                      .AUTHPLAYER
                                                                      .playerUid,
                                                              'notification_to_player':
                                                                  notificationsListItem
                                                                      .notificationFromPlayer
                                                                      .playerUid,
                                                              'notification_type':
                                                                  'Принял заявку вступления в клан',
                                                              'notification_body':
                                                                  'Игрок ${FFAppState().AUTHPLAYER.playerNickname}приянял приглашение вступить в команду.',
                                                              'notification_category':
                                                                  'От игрока',
                                                            });
                                                            await MessageTable()
                                                                .insert({
                                                              'message_sander':
                                                                  '0',
                                                              'message_body':
                                                                  'Игрок ${FFAppState().AUTHPLAYER.playerNickname}покинул команду',
                                                              'message_chat':
                                                                  FFAppState()
                                                                      .AUTHPLAYERTEAM
                                                                      .teamChatId,
                                                              'message_sander_avatar':
                                                                  'https://supabase.proplayclub.ru/storage/v1/object/public/playground/playerAvatars/Iconarchive-Robot-Avatar-Blue-2-Robot-Avatar.512.png',
                                                              'message_type':
                                                                  'Сообщение бота',
                                                            });
                                                            await MessageTable()
                                                                .insert({
                                                              'message_sander':
                                                                  '0',
                                                              'message_body':
                                                                  'Игрок ${FFAppState().AUTHPLAYER.playerNickname}чступил в команду команду',
                                                              'message_chat':
                                                                  notificationsListItem
                                                                      .notificationFromTeam
                                                                      .teamChatId,
                                                              'message_sander_avatar':
                                                                  'https://supabase.proplayclub.ru/storage/v1/object/public/playground/playerAvatars/Iconarchive-Robot-Avatar-Blue-2-Robot-Avatar.512.png',
                                                              'message_type':
                                                                  'Сообщение бота',
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
                                                                'player_tag':
                                                                    notificationsListItem
                                                                        .notificationFromTeam
                                                                        .teamTag,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'player_uid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            _model.jsonTEAMCHATold2 =
                                                                await MessagingGroup
                                                                    .getchatbyidCall
                                                                    .call(
                                                              chatID: FFAppState()
                                                                  .AUTHPLAYERTEAM
                                                                  .teamChatId,
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                      .STRINGARRAY =
                                                                  MessagingGroup
                                                                      .getchatbyidCall
                                                                      .chatmembers(
                                                                        (_model.jsonTEAMCHATold2?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .removeFromSTRINGARRAY(
                                                                      currentUserUid);
                                                            });
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'chat_members':
                                                                    FFAppState()
                                                                        .STRINGARRAY,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'chat_id',
                                                                FFAppState()
                                                                    .AUTHPLAYERTEAM
                                                                    .teamChatId,
                                                              ),
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                  .STRINGARRAY = [];
                                                            });
                                                            _model.jsonTEAMCHAT1 =
                                                                await MessagingGroup
                                                                    .getchatbyidCall
                                                                    .call(
                                                              chatID: notificationsListItem
                                                                  .notificationFromTeam
                                                                  .teamChatId,
                                                            );
                                                            setState(() {
                                                              FFAppState()
                                                                      .STRINGARRAY =
                                                                  MessagingGroup
                                                                      .getchatbyidCall
                                                                      .chatmembers(
                                                                        (_model.jsonTEAMCHAT1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToSTRINGARRAY(
                                                                      currentUserUid);
                                                            });
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'chat_members':
                                                                    FFAppState()
                                                                        .STRINGARRAY,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'chat_id',
                                                                MessagingGroup
                                                                    .getchatbyidCall
                                                                    .chatid(
                                                                  (_model.jsonTEAMCHAT1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              ),
                                                            );
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
                                                                    (e) => e.remove(
                                                                        notificationsListItem),
                                                                  ),
                                                              );
                                                              FFAppState()
                                                                  .STRINGARRAY = [];
                                                            });

                                                            context.pushNamed(
                                                                'HOME');
                                                          }

                                                          setState(() {});
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
