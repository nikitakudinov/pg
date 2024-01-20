import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournamentvieworganizators_model.dart';
export 'tournamentvieworganizators_model.dart';

class TournamentvieworganizatorsWidget extends StatefulWidget {
  const TournamentvieworganizatorsWidget({
    Key? key,
    required this.tournamentId,
  }) : super(key: key);

  final int? tournamentId;

  @override
  _TournamentvieworganizatorsWidgetState createState() =>
      _TournamentvieworganizatorsWidgetState();
}

class _TournamentvieworganizatorsWidgetState
    extends State<TournamentvieworganizatorsWidget> {
  late TournamentvieworganizatorsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentvieworganizatorsModel());
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<TournamentOrganizatorsRow>>(
            future: TournamentOrganizatorsTable().queryRows(
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
              List<TournamentOrganizatorsRow>
                  listViewTournamentOrganizatorsRowList = snapshot.data!;
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'PLAYER-VIEW',
                    queryParameters: {
                      'playerId': serializeParam(
                        0,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    15.0,
                    0,
                    15.0,
                    0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listViewTournamentOrganizatorsRowList.length,
                  separatorBuilder: (_, __) => SizedBox(width: 15.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewTournamentOrganizatorsRow =
                        listViewTournamentOrganizatorsRowList[listViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'PLAYER-VIEW',
                          queryParameters: {
                            'playerId': serializeParam(
                              FFAppState()
                                  .MAINDATA
                                  .players
                                  .where((e) =>
                                      e.playerUid ==
                                      listViewTournamentOrganizatorsRow
                                          .playerUid)
                                  .toList()
                                  .first
                                  .playerId,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                FFAppState()
                                    .MAINDATA
                                    .players
                                    .where((e) =>
                                        e.playerUid ==
                                        listViewTournamentOrganizatorsRow
                                            .playerUid)
                                    .toList()
                                    .first
                                    .playerAvatar,
                                width: 65.0,
                                height: 65.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  '${FFAppState().MAINDATA.teams.where((e) => e.teamId == FFAppState().MAINDATA.players.where((e) => e.playerUid == listViewTournamentOrganizatorsRow.playerUid).toList().first.playerTeam).toList().first.teamTag}',
                                  'TAG',
                                ),
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  '${FFAppState().MAINDATA.players.where((e) => e.playerUid == listViewTournamentOrganizatorsRow.playerUid).toList().first.playerNickname}',
                                  'Никнейм',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ].divide(SizedBox(width: 3.0)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
