import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'call_member_model.dart';
export 'call_member_model.dart';

class CallMemberWidget extends StatefulWidget {
  const CallMemberWidget({
    Key? key,
    bool? bodyVisibility,
  })  : this.bodyVisibility = bodyVisibility ?? false,
        super(key: key);

  final bool bodyVisibility;

  @override
  _CallMemberWidgetState createState() => _CallMemberWidgetState();
}

class _CallMemberWidgetState extends State<CallMemberWidget> {
  late CallMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallMemberModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.bodyVisibility,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_model.messagetextVISIBILITY)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Отправить приглашение этому игроку?',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ),
                if (_model.playerdataVISIBILITY)
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.network(
                                      FFAppState()
                                          .MAINDATA
                                          .players
                                          .where((e) =>
                                              e.playerId ==
                                              functions.stringTOinteger(
                                                  _model.textController.text))
                                          .toList()[0]
                                          .playerAvatar,
                                      width: 60.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          '${FFAppState().MAINDATA.players.where((e) => e.playerId == functions.stringTOinteger(_model.textController.text)).toList()[0].playerTag}',
                                          'TAG',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${FFAppState().MAINDATA.players.where((e) => e.playerId == functions.stringTOinteger(_model.textController.text)).toList()[0].playerNickname}',
                                          'Nickname',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
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
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              FFAppState()
                                                  .MAINDATA
                                                  .players
                                                  .where((e) =>
                                                      e.playerId ==
                                                      functions.stringTOinteger(
                                                          _model.textController
                                                              .text))
                                                  .toList()[0]
                                                  .playerFlag,
                                              width: 20.0,
                                              height: 12.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${FFAppState().MAINDATA.players.where((e) => e.playerId == functions.stringTOinteger(_model.textController.text)).toList()[0].playerCountrie}',
                                          'Country',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_model.searchVISIBILITY)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: '#UID игрока',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 15.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.apiResultxwd =
                                await PlayerGroup.listplayerbyidCall.call(
                              idList: _model.textController.text,
                            );
                            if ((_model.apiResultxwd?.succeeded ?? true)) {
                              setState(() {
                                _model.messagetextVISIBILITY = true;
                                _model.playerdataVISIBILITY = true;
                                _model.searchVISIBILITY = false;
                                _model.buttonsVISIBILITY = true;
                                _model.player = PlayerStruct.maybeFromMap(
                                    (_model.apiResultxwd?.jsonBody ?? ''));
                              });
                            }

                            setState(() {});
                          },
                          text: 'Найти',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ),
                if (_model.buttonsVISIBILITY)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Нет',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.addNotification1 =
                                await NotificationsTable().insert({
                              'notification_created_at':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'notification_from_team':
                                  FFAppState().AUTHPLAYER.playerTeam,
                              'notification_to_player': FFAppState()
                                  .MAINDATA
                                  .players
                                  .where((e) =>
                                      e.playerId ==
                                      functions.stringTOinteger(
                                          _model.textController.text))
                                  .toList()[0]
                                  .playerUid,
                              'notification_from_player': currentUserUid,
                              'notification_type': 'Приглашение в команду',
                              'notification_body':
                                  'Команда ${FFAppState().AUTHPLAYERTEAM.teamName}  предлагает вступить в ее ряды.',
                              'notification_category': 'От команды',
                            });
                            setState(() {
                              _model.player = null;
                            });
                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: 'Да',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
