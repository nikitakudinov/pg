import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teamadd2_model.dart';
export 'teamadd2_model.dart';

class Teamadd2Widget extends StatefulWidget {
  const Teamadd2Widget({Key? key}) : super(key: key);

  @override
  _Teamadd2WidgetState createState() => _Teamadd2WidgetState();
}

class _Teamadd2WidgetState extends State<Teamadd2Widget> {
  late Teamadd2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Teamadd2Model());

    _model.teamNameController ??= TextEditingController();
    _model.teamNameFocusNode ??= FocusNode();

    _model.teamTagController ??= TextEditingController();
    _model.teamTagFocusNode ??= FocusNode();
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Создать команду',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 5.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    _model.teamLogoPath,
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            if (_model.teamLogoPath ==
                                'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia = await selectMedia(
                                      storageFolderPath: 'tournamentLogos',
                                      maxWidth: 150.00,
                                      maxHeight: 150.00,
                                      imageQuality: 100,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls =
                                            await uploadSupabaseStorageFiles(
                                          bucketName: 'playground',
                                          selectedFiles: selectedMedia,
                                        );
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    setState(() {
                                      _model.teamLogoPath =
                                          _model.uploadedFileUrl;
                                    });
                                  },
                                  text: 'Загрузить ',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: Color(0xFF5C676E),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                              ),
                            if (_model.teamLogoPath !=
                                'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await deleteSupabaseFileFromPublicUrl(
                                        _model.teamLogoPath);
                                    setState(() {
                                      _model.teamLogoPath =
                                          'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png';
                                    });
                                  },
                                  text: 'Удалить',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: Color(0xFF5C676E),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: TextFormField(
                                      controller: _model.teamNameController,
                                      focusNode: _model.teamNameFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Название',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .teamNameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: TextFormField(
                                        controller: _model.teamTagController,
                                        focusNode: _model.teamTagFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Тэг',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cabin Condensed',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .teamTagControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: wrapWithModel(
                                          model: _model.countryPickerModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: CountryPickerWidget(
                                            selectedCountry: 'Не выбрано',
                                            selectedFlag:
                                                'https://supabase.proplayclub.ru/storage/v1/object/public/playground/ANARCHY.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('HOME');
                          },
                          text: 'ОТМЕНА',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Color(0xFF5C676E),
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await TeamsTable().insert({
                              'team_name': _model.teamNameController.text,
                              'team_tag': _model.teamTagController.text,
                              'team_flag':
                                  _model.countryPickerModel.selectedFlag,
                              'team_country':
                                  _model.countryPickerModel.selectedCountry,
                              'team_creator': currentUserUid,
                              'team_logo': _model.teamLogoPath,
                              'team_recruitment': true,
                              'team_status': 'Актив',
                            });
                            _model.jsonTEAM =
                                await TeamGroup.teambycreatorCall.call(
                              idList: currentUserUid,
                            );
                            setState(() {
                              _model.chatMembersArray = ['0'];
                            });
                            setState(() {
                              _model.addToChatMembersArray(currentUserUid);
                            });
                            await ChatsTable().insert({
                              'chat_last_message':
                                  'В этом чате пока нет сообщений',
                              'chat_of_team': TeamGroup.teambycreatorCall
                                  .teamid(
                                    (_model.jsonTEAM?.jsonBody ?? ''),
                                  )
                                  ?.first,
                              'chat_chattype': 'Чат команды',
                              'chat_last_message_sander': '0',
                              'chat_members': _model.chatMembersArray,
                            });
                            _model.jsonCHAT =
                                await MessagingGroup.chatbyteamidCall.call(
                              idList: TeamGroup.teambycreatorCall
                                  .teamid(
                                    (_model.jsonTEAM?.jsonBody ?? ''),
                                  )
                                  ?.first
                                  ?.toString(),
                            );
                            await TeamsTable().update(
                              data: {
                                'team_chat_id':
                                    MessagingGroup.chatbyteamidCall.chatid(
                                  (_model.jsonCHAT?.jsonBody ?? ''),
                                ),
                              },
                              matchingRows: (rows) => rows.eq(
                                'team_id',
                                TeamGroup.teambycreatorCall
                                    .teamid(
                                      (_model.jsonTEAM?.jsonBody ?? ''),
                                    )
                                    ?.first,
                              ),
                            );
                            await PlayersTable().update(
                              data: {
                                'player_team': TeamGroup.teambycreatorCall
                                    .teamid(
                                      (_model.jsonTEAM?.jsonBody ?? ''),
                                    )
                                    ?.first,
                                'player_tag': _model.teamTagController.text,
                                'player_team_role': ['Основатель'],
                              },
                              matchingRows: (rows) => rows.eq(
                                'player_uid',
                                currentUserUid,
                              ),
                            );
                            await action_blocks.maindataloader(context);

                            context.pushNamed(
                              'TEAM_EDITE',
                              queryParameters: {
                                'teamId': serializeParam(
                                  TeamGroup.teambycreatorCall
                                      .teamid(
                                        (_model.jsonTEAM?.jsonBody ?? ''),
                                      )
                                      ?.first,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {});
                          },
                          text: 'СОЗДАТЬ',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Color(0xFF5C676E),
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 15.0))
                        .addToStart(SizedBox(width: 15.0))
                        .addToEnd(SizedBox(width: 15.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
