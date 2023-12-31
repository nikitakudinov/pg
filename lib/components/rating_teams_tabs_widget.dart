import '/backend/schema/structs/index.dart';
import '/components/loadingindicator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_teams_tabs_model.dart';
export 'rating_teams_tabs_model.dart';

class RatingTeamsTabsWidget extends StatefulWidget {
  const RatingTeamsTabsWidget({
    Key? key,
    required this.teams,
  }) : super(key: key);

  final List<TeamStruct>? teams;

  @override
  _RatingTeamsTabsWidgetState createState() => _RatingTeamsTabsWidgetState();
}

class _RatingTeamsTabsWidgetState extends State<RatingTeamsTabsWidget> {
  late RatingTeamsTabsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingTeamsTabsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Рейтинги',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        Text(
                          _model.byMatchActive
                              ? 'По выйгранным матчам'
                              : 'По выйгранным раундам',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.byRoundActive = false;
                              _model.byMatchActive = true;
                            });
                          },
                          text: 'МАТЧИ',
                          options: FFButtonOptions(
                            height: 25.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsets.all(0.0),
                            color: _model.byMatchActive == true
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: _model.byMatchActive == true
                                      ? FlutterFlowTheme.of(context).accent2
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  fontSize: 10.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.byRoundActive = true;
                              _model.byMatchActive = false;
                            });
                          },
                          text: 'РАУНДЫ',
                          options: FFButtonOptions(
                            height: 25.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsets.all(0.0),
                            color: _model.byRoundActive == true
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: _model.byRoundActive == true
                                      ? FlutterFlowTheme.of(context).accent2
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  fontSize: 10.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 5.0))
                          .addToStart(SizedBox(width: 10.0))
                          .addToEnd(SizedBox(width: 10.0)),
                    ),
                  ),
                ],
              ),
              if (FFAppState().MAINDATA.teams.length == 0)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.loadingindicatorModel,
                      updateCallback: () => setState(() {}),
                      child: LoadingindicatorWidget(),
                    ),
                  ),
                ),
              if (_model.byMatchActive)
                Builder(
                  builder: (context) {
                    final teamsList = widget.teams!
                        .where((e) => e.teamMatchesCount != 0)
                        .toList()
                        .sortedList((e) => e.teamMatchWins)
                        .toList();
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        15.0,
                        0,
                        15.0,
                      ),
                      reverse: true,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: teamsList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 5.0),
                      itemBuilder: (context, teamsListIndex) {
                        final teamsListItem = teamsList[teamsListIndex];
                        return Container(
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
                                if (MediaQuery.sizeOf(context).width >= 350.0)
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
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 1400),
                                          fadeOutDuration:
                                              Duration(milliseconds: 1400),
                                          imageUrl: teamsListItem.teamLogo,
                                          width: 50.0,
                                          height: 50.0,
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
                                        '${teamsListItem.teamTag}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      if (MediaQuery.sizeOf(context).width >=
                                          350.0)
                                        Text(
                                          '${teamsListItem.teamName}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      if (MediaQuery.sizeOf(context).width >=
                                          350.0)
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
                                                    teamsListItem.teamFlag,
                                                    width: 20.0,
                                                    height: 12.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${teamsListItem.teamCountry}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
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
                                        '${teamsListItem.teamMatchesCount.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ПОБЕД',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Cabin Condensed',
                                              fontSize: 10.0,
                                            ),
                                      ),
                                      Text(
                                        '${teamsListItem.teamMatchWins.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ПОРАЖ.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Cabin Condensed',
                                              fontSize: 10.0,
                                            ),
                                      ),
                                      Text(
                                        '${teamsListItem.teamMatchLoses.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'В/П',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                          Text(
                                            'RATE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Cabin Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  fontSize: 8.0,
                                                  lineHeight: 0.9,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        formatNumber(
                                          teamsListItem.teamMatchWins /
                                              teamsListItem.teamMatchLoses,
                                          formatType: FormatType.custom,
                                          format: '#.#',
                                          locale: '',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
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
              if (_model.byRoundActive)
                Builder(
                  builder: (context) {
                    final teamsList = widget.teams!
                        .where((e) => e.teamMatchesCount != 0)
                        .toList()
                        .sortedList((e) => e.teamMatchRoundWins)
                        .toList();
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        15.0,
                        0,
                        15.0,
                      ),
                      reverse: true,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: teamsList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 5.0),
                      itemBuilder: (context, teamsListIndex) {
                        final teamsListItem = teamsList[teamsListIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            context.pushNamed(
                              'TEAM_VIEW',
                              queryParameters: {
                                'teamID': serializeParam(
                                  teamsListItem.teamId,
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
                                  if (MediaQuery.sizeOf(context).width >= 350.0)
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
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 1400),
                                            fadeOutDuration:
                                                Duration(milliseconds: 1400),
                                            imageUrl: teamsListItem.teamLogo,
                                            width: 50.0,
                                            height: 50.0,
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
                                          '${teamsListItem.teamTag}',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                        if (MediaQuery.sizeOf(context).width >=
                                            350.0)
                                          Text(
                                            '${teamsListItem.teamName}',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        if (MediaQuery.sizeOf(context).width >=
                                            350.0)
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
                                                      teamsListItem.teamFlag,
                                                      width: 20.0,
                                                      height: 12.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${teamsListItem.teamCountry}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
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
                                          '${teamsListItem.teamMatchesRoundsCount.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ПОБЕД',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Cabin Condensed',
                                                fontSize: 10.0,
                                              ),
                                        ),
                                        Text(
                                          '${teamsListItem.teamMatchRoundWins.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ПОРАЖ.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Cabin Condensed',
                                                fontSize: 10.0,
                                              ),
                                        ),
                                        Text(
                                          '${teamsListItem.teamMatchRoundLoses.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'В/П',
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
                                              'RATE',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        fontSize: 8.0,
                                                        lineHeight: 0.9,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          formatNumber(
                                            teamsListItem.teamMatchRoundWins /
                                                teamsListItem
                                                    .teamMatchRoundLoses,
                                            formatType: FormatType.custom,
                                            format: '#.#',
                                            locale: '',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
