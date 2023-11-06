import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultxyl = await UserGroup.listuserbyuidCall.call(
        idList: currentUserUid,
      );
      if ((_model.apiResultxyl?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().authenticateduser = UserStruct(
            id: UserGroup.listuserbyuidCall.id(
              (_model.apiResultxyl?.jsonBody ?? ''),
            ),
            nickname: UserGroup.listuserbyuidCall
                .nickname(
                  (_model.apiResultxyl?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            createdAt: UserGroup.listuserbyuidCall
                .createdat(
                  (_model.apiResultxyl?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            email: UserGroup.listuserbyuidCall
                .email(
                  (_model.apiResultxyl?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            tag: UserGroup.listuserbyuidCall
                .tag(
                  (_model.apiResultxyl?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            uid: UserGroup.listuserbyuidCall
                .uid(
                  (_model.apiResultxyl?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
          );
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('2'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
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
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFAppState().authenticateduser.nickname,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                FFAppState().authenticateduser.createdAt,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                FFAppState().authenticateduser.email,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                FFAppState().authenticateduser.tag,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
