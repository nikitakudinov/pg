import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/team_view_header_widget.dart';
import '/components/team_view_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_view_model.dart';
export 'team_view_model.dart';

class TeamViewWidget extends StatefulWidget {
  const TeamViewWidget({
    Key? key,
    int? teamID,
  })  : this.teamID = teamID ?? 0,
        super(key: key);

  final int teamID;

  @override
  _TeamViewWidgetState createState() => _TeamViewWidgetState();
}

class _TeamViewWidgetState extends State<TeamViewWidget> {
  late TeamViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamViewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: true,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                FFIcons.kdeleteBin2Fill,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await ChatsTable().delete(
                  matchingRows: (rows) => rows.eq(
                    'chat_id',
                    FFAppState()
                        .MAINDATA
                        .teams
                        .where((e) => e.teamId == widget.teamID)
                        .toList()
                        .first
                        .teamChatId,
                  ),
                );
                await TeamsTable().delete(
                  matchingRows: (rows) => rows.eq(
                    'team_id',
                    widget.teamID,
                  ),
                );

                context.pushNamed('HOME');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.teamViewHeaderModel,
                updateCallback: () => setState(() {}),
                child: TeamViewHeaderWidget(
                  teamId: widget.teamID,
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.teamViewMembersModel,
                  updateCallback: () => setState(() {}),
                  child: TeamViewMembersWidget(
                    teamId: widget.teamID,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
