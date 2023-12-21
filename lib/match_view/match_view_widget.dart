import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_view_model.dart';
export 'match_view_model.dart';

class MatchViewWidget extends StatefulWidget {
  const MatchViewWidget({
    Key? key,
    int? matchID,
  })  : this.matchID = matchID ?? 0,
        super(key: key);

  final int matchID;

  @override
  _MatchViewWidgetState createState() => _MatchViewWidgetState();
}

class _MatchViewWidgetState extends State<MatchViewWidget> {
  late MatchViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.jsonMATCHdata = await MatchGroup.matchbyidCall.call(
        matchID: widget.matchID,
      );
      if ((_model.jsonMATCHdata?.succeeded ?? true)) {
        _model.dtMATCHdata = await actions.dtMATCH(
          (_model.jsonMATCHdata?.jsonBody ?? ''),
        );
        setState(() {
          _model.curentMatchData =
              _model.dtMATCHdata!.toList().cast<MatchStruct>();
        });
      }
    });
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
            'Матч',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: (_model.curentMatchData.isNotEmpty) == false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  _model.curentMatchData.first.matchStatus,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
