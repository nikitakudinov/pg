import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/grid_round/grid_round_widget.dart';
import '/components/loadingindicator_widget.dart';
import '/components/matchreport_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test2_model.dart';
export 'test2_model.dart';

class Test2Widget extends StatefulWidget {
  const Test2Widget({
    Key? key,
    int? tournamentId,
  })  : this.tournamentId = tournamentId ?? 0,
        super(key: key);

  final int tournamentId;

  @override
  _Test2WidgetState createState() => _Test2WidgetState();
}

class _Test2WidgetState extends State<Test2Widget> {
  late Test2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().updateVISIBILITYStruct(
          (e) => e..loadingIndicator = true,
        );
      });
      await action_blocks.matchesloader(context);
      setState(() {});
      setState(() {
        FFAppState().updateVISIBILITYStruct(
          (e) => e..loadingIndicator = false,
        );
      });
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
              context.pushNamed('TEST');
            },
            child: Icon(
              FFIcons.karrowLeftSM,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            FFAppState()
                .MAINDATA
                .tournaments
                .where((e) => e.tournamentId == widget.tournamentId)
                .toList()[0]
                .tournamentTag,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            wrapWithModel(
              model: _model.loadingindicatorModel,
              updateCallback: () => setState(() {}),
              child: LoadingindicatorWidget(),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    FFAppState().updateVISIBILITYStruct(
                      (e) => e..loadingIndicator = true,
                    );
                  });
                  await action_blocks.matchesloader(context);
                  setState(() {});
                  setState(() {
                    FFAppState().updateVISIBILITYStruct(
                      (e) => e..loadingIndicator = false,
                    );
                  });
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.vlistITEMModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: VlistITEMWidget(
                          imageSize: 80,
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiary,
                          title: FFAppState()
                              .MAINDATA
                              .tournaments
                              .where(
                                  (e) => e.tournamentId == widget.tournamentId)
                              .toList()
                              .first
                              .tournamentTag,
                          subtitle: FFAppState()
                              .MAINDATA
                              .tournaments
                              .where(
                                  (e) => e.tournamentId == widget.tournamentId)
                              .toList()
                              .first
                              .tournamentName,
                          country: FFAppState()
                              .MAINDATA
                              .tournaments
                              .where(
                                  (e) => e.tournamentId == widget.tournamentId)
                              .toList()
                              .first
                              .tournamentCountry,
                          flag: FFAppState()
                              .MAINDATA
                              .tournaments
                              .where(
                                  (e) => e.tournamentId == widget.tournamentId)
                              .toList()
                              .first
                              .tournamentFlag,
                          image: FFAppState()
                              .MAINDATA
                              .tournaments
                              .where(
                                  (e) => e.tournamentId == widget.tournamentId)
                              .toList()
                              .first
                              .tournamentLogo,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: MatchreportWidget(
                                            tournamentmatches: FFAppState()
                                                .MAINDATA
                                                .matches
                                                .where((e) =>
                                                    e.matchForTournament
                                                        .tournamentId ==
                                                    widget.tournamentId)
                                                .toList(),
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              text: 'Матч репорт',
                              icon: FaIcon(
                                FontAwesomeIcons.fileExport,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 30.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 15.0))
                            .addToEnd(SizedBox(width: 15.0)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Турнирная сетка',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      wrapWithModel(
                                        model: _model.gridRoundModel1,
                                        updateCallback: () => setState(() {}),
                                        child: GridRoundWidget(
                                          round: 1,
                                          iteamspacing: 5,
                                          paddingtop: 5,
                                          itemheight: 110,
                                          pairFrom: 0,
                                          pairTo: 8,
                                          tournamentId: widget.tournamentId,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  165.0, 60.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.gridRoundModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: GridRoundWidget(
                                              round: 2,
                                              iteamspacing: 120,
                                              paddingtop: 5,
                                              itemheight: 110,
                                              pairFrom: 0,
                                              pairTo: 4,
                                              tournamentId: widget.tournamentId,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            260.0, 175.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel3,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 3,
                                            iteamspacing: 350,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 0,
                                            pairTo: 2,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            380.0, 405.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel4,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 4,
                                            iteamspacing: 110,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 1,
                                            pairTo: 1,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            545.0, 350.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel5,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 5,
                                            iteamspacing: 5,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 0,
                                            pairTo: 2,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            710.0, 405.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel6,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 4,
                                            iteamspacing: 110,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 2,
                                            pairTo: 2,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            875.0, 175.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel7,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 3,
                                            iteamspacing: 350,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 3,
                                            pairTo: 4,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1040.0, 60.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.gridRoundModel8,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: GridRoundWidget(
                                              round: 2,
                                              iteamspacing: 120,
                                              paddingtop: 5,
                                              itemheight: 110,
                                              pairFrom: 5,
                                              pairTo: 8,
                                              tournamentId: widget.tournamentId,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1200.0, 0.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.gridRoundModel9,
                                          updateCallback: () => setState(() {}),
                                          child: GridRoundWidget(
                                            round: 1,
                                            iteamspacing: 5,
                                            paddingtop: 5,
                                            itemheight: 110,
                                            pairFrom: 9,
                                            pairTo: 16,
                                            tournamentId: widget.tournamentId,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 10.0))
                              .addToStart(SizedBox(height: 15.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (FFAppState().MAINDATA.notifications.length != 0)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Builder(
                      builder: (context) {
                        final notificationsList =
                            FFAppState().MAINDATA.notifications.toList();
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
                                                        'Keyvoc_${notificationsListIndex}_of_${notificationsList.length}'),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                      (notificationsListItem.match.matchTournamentPair ==
                                                          2)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) &&
                                                      (notificationsListItem.match.matchTournamentPair == 10)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 11)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 12)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 13)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 14)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 15)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 1) && (notificationsListItem.match.matchTournamentPair == 16)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 3)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 4)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 5)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 6)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 7)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 2) && (notificationsListItem.match.matchTournamentPair == 8)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 3)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 3) && (notificationsListItem.match.matchTournamentPair == 4)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 4) && (notificationsListItem.match.matchTournamentPair == 1)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else if ((notificationsListItem.match.matchTournamentRound == 4) && (notificationsListItem.match.matchTournamentPair == 2)) {
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    await MatchesTable().update(
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
                                                      matchingRows: (rows) =>
                                                          rows
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Данные матча обновлены',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1000),
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
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
