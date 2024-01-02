import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 10.0),
            child: Text(
              'Состав команды',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ),
        ),
        Builder(
          builder: (context) {
            final members = FFAppState()
                .MAINDATA
                .players
                .where((e) => e.playerTeam == widget.teamId)
                .toList();
            return ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: members.length,
              separatorBuilder: (_, __) => SizedBox(height: 5.0),
              itemBuilder: (context, membersIndex) {
                final membersItem = members[membersIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                membersItem.playerAvatar,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  '${membersItem.playerNickname}',
                                  'Никнейм',
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  '${membersItem.playerTeamRole.first}',
                                  'Роль',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cabin Condensed',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            dateTimeFormat(
                                'relative', membersItem.playerTeamJoinedAt!),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            FFIcons.kmessageCircleOutline,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('MESSAGE pressed ...');
                          },
                        ),
                      ]
                          .divide(SizedBox(width: 10.0))
                          .addToStart(SizedBox(width: 5.0))
                          .addToEnd(SizedBox(width: 5.0)),
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
