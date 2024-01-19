import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Участники турнира',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
        ),
        Builder(
          builder: (context) {
            final tournamentMembersRow = FFAppState()
                .MAINDATA
                .tournamentMembers
                .where((e) => e.tournamentId == widget.tournamentId)
                .toList();
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                10.0,
                0,
                10.0,
              ),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: tournamentMembersRow.length,
              separatorBuilder: (_, __) => SizedBox(height: 5.0),
              itemBuilder: (context, tournamentMembersRowIndex) {
                final tournamentMembersRowItem =
                    tournamentMembersRow[tournamentMembersRowIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
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
                                        tournamentMembersRowItem.teamId)
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
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFAppState()
                                  .MAINDATA
                                  .teams
                                  .where((e) =>
                                      e.teamId ==
                                      tournamentMembersRowItem.teamId)
                                  .toList()
                                  .first
                                  .teamTag,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            Text(
                              FFAppState()
                                  .MAINDATA
                                  .teams
                                  .where((e) =>
                                      e.teamId ==
                                      tournamentMembersRowItem.teamId)
                                  .toList()
                                  .first
                                  .teamName,
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        FFAppState()
                                            .MAINDATA
                                            .teams
                                            .where((e) =>
                                                e.teamId ==
                                                tournamentMembersRowItem.teamId)
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
                                          tournamentMembersRowItem.teamId)
                                      .toList()
                                      .first
                                      .teamCountry,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
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
      ].addToStart(SizedBox(height: 15.0)).addToEnd(SizedBox(height: 15.0)),
    );
  }
}
