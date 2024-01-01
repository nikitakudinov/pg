import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_view_header_model.dart';
export 'team_view_header_model.dart';

class TeamViewHeaderWidget extends StatefulWidget {
  const TeamViewHeaderWidget({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final int? teamId;

  @override
  _TeamViewHeaderWidgetState createState() => _TeamViewHeaderWidgetState();
}

class _TeamViewHeaderWidgetState extends State<TeamViewHeaderWidget> {
  late TeamViewHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamViewHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 200.0,
          decoration: BoxDecoration(),
          child: Visibility(
            visible: FFAppState()
                    .MAINDATA
                    .teams
                    .where((e) => e.teamId == widget.teamId)
                    .toList()[0]
                    .teamHeader !=
                '0',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                FFAppState()
                    .MAINDATA
                    .teams
                    .where((e) => e.teamId == widget.teamId)
                    .toList()[0]
                    .teamHeader,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      FFAppState()
                          .MAINDATA
                          .teams
                          .where((e) => e.teamId == widget.teamId)
                          .toList()[0]
                          .teamLogo,
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          '${FFAppState().MAINDATA.teams.where((e) => e.teamId == widget.teamId).toList()[0].teamTag}',
                          'ТЕГ',
                        ),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${FFAppState().MAINDATA.teams.where((e) => e.teamId == widget.teamId).toList()[0].teamName}',
                        'Название команды',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
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
                                    .where((e) => e.teamId == widget.teamId)
                                    .toList()[0]
                                    .teamFlag,
                                width: 20.0,
                                height: 12.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            '${FFAppState().MAINDATA.teams.where((e) => e.teamId == widget.teamId).toList()[0].teamCountry}',
                            'Страна',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ].divide(SizedBox(width: 10.0)).addToStart(SizedBox(width: 15.0)),
            ),
          ),
        ),
      ],
    );
  }
}
