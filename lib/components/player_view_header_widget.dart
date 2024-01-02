import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_view_header_model.dart';
export 'player_view_header_model.dart';

class PlayerViewHeaderWidget extends StatefulWidget {
  const PlayerViewHeaderWidget({
    Key? key,
    required this.playerId,
  }) : super(key: key);

  final int? playerId;

  @override
  _PlayerViewHeaderWidgetState createState() => _PlayerViewHeaderWidgetState();
}

class _PlayerViewHeaderWidgetState extends State<PlayerViewHeaderWidget> {
  late PlayerViewHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerViewHeaderModel());
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
      height: 120.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  FFAppState()
                      .MAINDATA
                      .players
                      .where((e) => e.playerId == widget.playerId)
                      .toList()[0]
                      .playerAvatar,
                  width: 65.0,
                  height: 65.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    '${FFAppState().MAINDATA.players.where((e) => e.playerId == widget.playerId).toList()[0].playerNickname}',
                    'Никнейм',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        '${FFAppState().MAINDATA.teams.where((e) => e.teamId == FFAppState().MAINDATA.players.where((e) => e.playerId == widget.playerId).toList()[0].playerTeam).toList()[0].teamTag}',
                        'ТЕГ',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${FFAppState().MAINDATA.teams.where((e) => e.teamId == FFAppState().MAINDATA.players.where((e) => e.playerId == widget.playerId).toList()[0].playerTeam).toList()[0].teamName}',
                        'ТЕГ',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 24.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          FFAppState()
                              .MAINDATA
                              .players
                              .where((e) => e.playerId == widget.playerId)
                              .toList()[0]
                              .playerFlag,
                          width: 24.0,
                          height: 16.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${FFAppState().MAINDATA.players.where((e) => e.playerId == widget.playerId).toList()[0].playerCountrie}',
                        'Страна',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ],
            ),
          ]
              .divide(SizedBox(width: 10.0))
              .addToStart(SizedBox(width: 20.0))
              .addToEnd(SizedBox(width: 20.0)),
        ),
      ),
    );
  }
}
