import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_avatar_with_indicator_model.dart';
export 'player_avatar_with_indicator_model.dart';

class PlayerAvatarWithIndicatorWidget extends StatefulWidget {
  const PlayerAvatarWithIndicatorWidget({
    Key? key,
    required this.imagePath,
    required this.playerUID,
  }) : super(key: key);

  final String? imagePath;
  final String? playerUID;

  @override
  _PlayerAvatarWithIndicatorWidgetState createState() =>
      _PlayerAvatarWithIndicatorWidgetState();
}

class _PlayerAvatarWithIndicatorWidgetState
    extends State<PlayerAvatarWithIndicatorWidget> {
  late PlayerAvatarWithIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerAvatarWithIndicatorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          setState(() => _model.requestCompleter = null);
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PlayersRow>>(
      future: (_model.requestCompleter ??= Completer<List<PlayersRow>>()
            ..complete(PlayersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'player_uid',
                widget.playerUID,
              ),
            )))
          .future,
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
        List<PlayersRow> containerPlayersRowList = snapshot.data!;
        final containerPlayersRow = containerPlayersRowList.isNotEmpty
            ? containerPlayersRowList.first
            : null;
        return Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.imagePath!,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 3.0),
                  child: Icon(
                    Icons.circle_sharp,
                    color: valueOrDefault<Color>(
                      containerPlayersRow!.playerOnline
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).accent1,
                      FlutterFlowTheme.of(context).accent1,
                    ),
                    size: 12.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
