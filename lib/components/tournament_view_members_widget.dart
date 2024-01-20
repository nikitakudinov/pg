import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournament_view_members_model.dart';
export 'tournament_view_members_model.dart';

class TournamentViewMembersWidget extends StatefulWidget {
  const TournamentViewMembersWidget({
    Key? key,
    required this.tournamentId,
  }) : super(key: key);

  final int? tournamentId;

  @override
  _TournamentViewMembersWidgetState createState() =>
      _TournamentViewMembersWidgetState();
}

class _TournamentViewMembersWidgetState
    extends State<TournamentViewMembersWidget> {
  late TournamentViewMembersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentViewMembersModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            setState(() {
              _model.listVISIBILITY = !_model.listVISIBILITY;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Участники турнира',
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
            ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
          ),
        ),
        Container(
          decoration: BoxDecoration(),
          child: Visibility(
            visible: _model.listVISIBILITY,
            child: FutureBuilder<List<TournamentMembersRow>>(
              future: TournamentMembersTable().queryRows(
                queryFn: (q) => q.eq(
                  'tournament_id',
                  widget.tournamentId,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<TournamentMembersRow> listViewTournamentMembersRowList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewTournamentMembersRowList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewTournamentMembersRow =
                        listViewTournamentMembersRowList[listViewIndex];
                    return Visibility(
                      visible: () {
                        if (_model.pageNumber == 1) {
                          return ((listViewIndex > 0) && (listViewIndex < 6));
                        } else if (_model.pageNumber == 2) {
                          return ((listViewIndex > 5) && (listViewIndex < 11));
                        } else if (_model.pageNumber == 3) {
                          return ((listViewIndex > 10) && (listViewIndex < 16));
                        } else if (_model.pageNumber == 4) {
                          return ((listViewIndex > 15) && (listViewIndex < 21));
                        } else if (_model.pageNumber == 5) {
                          return ((listViewIndex > 20) && (listViewIndex < 26));
                        } else if (_model.pageNumber == 6) {
                          return ((listViewIndex > 25) && (listViewIndex < 31));
                        } else if (_model.pageNumber == 7) {
                          return ((listViewIndex > 30) && (listViewIndex < 36));
                        } else {
                          return true;
                        }
                      }(),
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
                                listViewTournamentMembersRow.teamId,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    FFAppState()
                                        .MAINDATA
                                        .teams
                                        .where((e) =>
                                            e.teamId ==
                                            listViewTournamentMembersRow.teamId)
                                        .toList()
                                        .first
                                        .teamLogo,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFAppState()
                                      .MAINDATA
                                      .teams
                                      .where((e) =>
                                          e.teamId ==
                                          listViewTournamentMembersRow.teamId)
                                      .toList()
                                      .first
                                      .teamTag,
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                Text(
                                  FFAppState()
                                      .MAINDATA
                                      .teams
                                      .where((e) =>
                                          e.teamId ==
                                          listViewTournamentMembersRow.teamId)
                                      .toList()
                                      .first
                                      .teamName,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                                .MAINDATA
                                                .teams
                                                .where((e) =>
                                                    e.teamId ==
                                                    listViewTournamentMembersRow
                                                        .teamId)
                                                .toList()
                                                .first
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
                                          .MAINDATA
                                          .teams
                                          .where((e) =>
                                              e.teamId ==
                                              listViewTournamentMembersRow
                                                  .teamId)
                                          .toList()
                                          .first
                                          .teamCountry,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]
                              .addToStart(SizedBox(width: 15.0))
                              .addToEnd(SizedBox(width: 15.0)),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FFButtonWidget(
              onPressed: () async {
                setState(() {
                  _model.pageNumber = _model.pageNumber + -1;
                });
              },
              text: '',
              icon: Icon(
                FFIcons.karrowLeftMD,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 10.0,
              ),
              options: FFButtonOptions(
                width: 30.0,
                height: 30.0,
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Cabin Condensed',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  '${_model.pageNumber.toString()}',
                  '1',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() {
                  _model.pageNumber = _model.pageNumber + 1;
                });
              },
              text: '',
              icon: Icon(
                FFIcons.karrowRightMD,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 10.0,
              ),
              options: FFButtonOptions(
                width: 30.0,
                height: 30.0,
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Cabin Condensed',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ].divide(SizedBox(width: 5.0)),
        ),
      ].addToStart(SizedBox(height: 15.0)).addToEnd(SizedBox(height: 15.0)),
    );
  }
}
