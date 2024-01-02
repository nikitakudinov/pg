import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_view_members_model.dart';
export 'team_view_members_model.dart';

class TeamViewMembersWidget extends StatefulWidget {
  const TeamViewMembersWidget({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final int? teamId;

  @override
  _TeamViewMembersWidgetState createState() => _TeamViewMembersWidgetState();
}

class _TeamViewMembersWidgetState extends State<TeamViewMembersWidget> {
  late TeamViewMembersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamViewMembersModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Builder(
        builder: (context) {
          final members = FFAppState()
              .MAINDATA
              .players
              .where((e) => e.playerTeam == widget.teamId)
              .toList();
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(
              15.0,
              0,
              15.0,
              0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: members.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.0),
            itemBuilder: (context, membersIndex) {
              final membersItem = members[membersIndex];
              return Container(
                width: 100.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          membersItem.playerAvatar,
                          width: 65.0,
                          height: 65.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${membersItem.playerNickname}',
                        'Никнейм',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${membersItem.playerTeamRole.first}',
                        'Никнейм',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 22.0,
                          height: 14.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              membersItem.playerFlag,
                              width: 22.0,
                              height: 14.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            valueOrDefault<String>(
                              '${membersItem.playerCountrie}',
                              'Страна',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
