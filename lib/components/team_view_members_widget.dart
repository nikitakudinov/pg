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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: Text(
            'Состав',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
        ),
        Builder(
          builder: (context) {
            final membersList = FFAppState()
                .MAINDATA
                .players
                .where((e) => e.playerTeam == widget.teamId)
                .toList();
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                10.0,
                0,
                0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: membersList.length,
              separatorBuilder: (_, __) => SizedBox(height: 5.0),
              itemBuilder: (context, membersListIndex) {
                final membersListItem = membersList[membersListIndex];
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              membersListItem.playerAvatar,
                              width: 50.0,
                              height: 50.0,
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
                                '${membersListItem.playerNickname}',
                                'Никнейм',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              valueOrDefault<String>(
                                '${membersListItem.playerTeamRole.first}',
                                'Роль в команде',
                              ),
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
                                        'https://picsum.photos/seed/728/600',
                                        width: 20.0,
                                        height: 12.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    '${membersListItem.playerCountrie}',
                                    'Страна',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
