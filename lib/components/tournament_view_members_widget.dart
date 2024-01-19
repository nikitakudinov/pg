import '/backend/supabase/supabase.dart';
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
      mainAxisSize: MainAxisSize.max,
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
        FutureBuilder<List<TournamentMembersRow>>(
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
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewTournamentMembersRowList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewTournamentMembersRow =
                    listViewTournamentMembersRowList[listViewIndex];
                return Text(
                  listViewTournamentMembersRow.teamId.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              },
            );
          },
        ),
      ].addToStart(SizedBox(height: 15.0)).addToEnd(SizedBox(height: 15.0)),
    );
  }
}
