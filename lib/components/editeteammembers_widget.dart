import '/backend/schema/structs/index.dart';
import '/components/team_members_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editeteammembers_model.dart';
export 'editeteammembers_model.dart';

class EditeteammembersWidget extends StatefulWidget {
  const EditeteammembersWidget({
    Key? key,
    int? teamId,
  })  : this.teamId = teamId ?? 0,
        super(key: key);

  final int teamId;

  @override
  _EditeteammembersWidgetState createState() => _EditeteammembersWidgetState();
}

class _EditeteammembersWidgetState extends State<EditeteammembersWidget> {
  late EditeteammembersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditeteammembersModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Состав',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: 3.0,
                    buttonSize: 25.0,
                    fillColor: FlutterFlowTheme.of(context).tertiary,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 10.0,
                    ),
                    onPressed: () async {
                      setState(() {
                        _model.callMemberVISIBILITY = true;
                      });
                    },
                  ),
                ),
              ],
            ),
            wrapWithModel(
              model: _model.callMemberModel,
              updateCallback: () => setState(() {}),
              child: TeamMembersWidget(
                bodyVisibility: _model.callMemberVISIBILITY,
              ),
            ),
            Builder(
              builder: (context) {
                final teamMemberList = FFAppState()
                    .MAINDATA
                    .players
                    .where((e) => e.playerTeam == widget.teamId)
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
                  itemCount: teamMemberList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 5.0),
                  itemBuilder: (context, teamMemberListIndex) {
                    final teamMemberListItem =
                        teamMemberList[teamMemberListIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: VlistITEMWidget(
                        key: Key(
                            'Keya5v_${teamMemberListIndex}_of_${teamMemberList.length}'),
                        imageSize: 45,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        title: teamMemberListItem.playerNickname,
                        subtitle: teamMemberListItem.playerTeamRole.first,
                        country: teamMemberListItem.playerCountrie,
                        flag: teamMemberListItem.playerFlag,
                        image: teamMemberListItem.playerAvatar,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
