import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournament_edite_model.dart';
export 'tournament_edite_model.dart';

class TournamentEditeWidget extends StatefulWidget {
  const TournamentEditeWidget({
    Key? key,
    int? tournamentIndedx,
    int? tournamentId,
  })  : this.tournamentIndedx = tournamentIndedx ?? 0,
        this.tournamentId = tournamentId ?? 0,
        super(key: key);

  final int tournamentIndedx;
  final int tournamentId;

  @override
  _TournamentEditeWidgetState createState() => _TournamentEditeWidgetState();
}

class _TournamentEditeWidgetState extends State<TournamentEditeWidget> {
  late TournamentEditeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentEditeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tournamentLogo =
            FFAppState().tournaments[widget.tournamentIndedx].tournamentLogo;
      });
      await action_blocks.countriesloader(context);
      setState(() {});
    });

    _model.expandableController1 = ExpandableController(initialExpanded: true);
    _model.tournamentNameController ??= TextEditingController(
        text: FFAppState().tournaments[widget.tournamentIndedx].tournamentName);
    _model.tournamentNameFocusNode ??= FocusNode();

    _model.tournamentTagController ??= TextEditingController(
        text: FFAppState().tournaments[widget.tournamentIndedx].tournamentTag);
    _model.tournamentTagFocusNode ??= FocusNode();

    _model.expandableController2 = ExpandableController(initialExpanded: true);
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
            'Управление турниром',
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
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                _model.tournamentMember =
                    await TournamentGroup.tournamentmembersCall.call(
                  tournamentID: widget.tournamentId.toString(),
                );
                setState(() {
                  _model.tournamentMembersIDs =
                      TournamentGroup.tournamentmembersCall
                          .teamsteamid(
                            (_model.tournamentMember?.jsonBody ?? ''),
                          )!
                          .cast<int>()
                          .toList()
                          .cast<int>();
                });
                while (_model.curentLoopCount! <= FFAppConstants.pairs16) {
                  setState(() {
                    _model.rival1 = valueOrDefault<int>(
                      functions.newCustomFunction(
                          _model.tournamentMembersIDs.toList()),
                      0,
                    );
                  });
                  await Future.delayed(const Duration(milliseconds: 2));
                  setState(() {
                    _model.removeFromTournamentMembersIDs(valueOrDefault<int>(
                      _model.rival1,
                      0,
                    ));
                  });
                  await Future.delayed(const Duration(milliseconds: 2));
                  setState(() {
                    _model.rival2 = valueOrDefault<int>(
                      functions.newCustomFunction(
                          _model.tournamentMembersIDs.toList()),
                      0,
                    );
                  });
                  await Future.delayed(const Duration(milliseconds: 2));
                  setState(() {
                    _model.removeFromTournamentMembersIDs(valueOrDefault<int>(
                      _model.rival2,
                      0,
                    ));
                  });
                  await MatchesTable().insert({
                    'match_tournament_round': 1,
                    'match_tournament_pair': _model.curentLoopCount,
                    'match_rival1': _model.rival1,
                    'match_rival2': _model.rival2,
                    'match_for_tournament': widget.tournamentId,
                    'match_status': 'Матч создан',
                    'match_date': '-.-.- -:-',
                    'match_planned_date': '-.-.- -:-',
                    'match_updateted_at':
                        supaSerialize<DateTime>(getCurrentTimestamp),
                  });
                  setState(() {
                    _model.curentLoopCount = _model.curentLoopCount! + 1;
                    _model.rival1 = 0;
                    _model.rival2 = 0;
                  });
                }
                setState(() {
                  _model.curentLoopCount = 1;
                });
                while (_model.curentLoopCount! <= FFAppConstants.pairs8) {
                  await MatchesTable().insert({
                    'match_date': '-.-.- -:-',
                    'match_tournament_round': 2,
                    'match_tournament_pair': _model.curentLoopCount,
                    'match_for_tournament': widget.tournamentId,
                    'match_status': 'Соперники не определены',
                    'match_updateted_at':
                        supaSerialize<DateTime>(getCurrentTimestamp),
                    'match_planned_date': '-.-.- -:-',
                  });
                  setState(() {
                    _model.curentLoopCount = _model.curentLoopCount! + 1;
                  });
                }
                setState(() {
                  _model.curentLoopCount = 1;
                });
                while (_model.curentLoopCount! <= FFAppConstants.pairs4) {
                  await MatchesTable().insert({
                    'match_date': '-.-.- -:-',
                    'match_tournament_round': 3,
                    'match_tournament_pair': _model.curentLoopCount,
                    'match_for_tournament': widget.tournamentId,
                    'match_status': 'Соперники не определены',
                    'match_updateted_at':
                        supaSerialize<DateTime>(getCurrentTimestamp),
                    'match_planned_date': '-.-.- -:-',
                  });
                  setState(() {
                    _model.curentLoopCount = _model.curentLoopCount! + 1;
                  });
                }
                setState(() {
                  _model.curentLoopCount = 1;
                });
                while (_model.curentLoopCount! <= FFAppConstants.pairs2) {
                  await MatchesTable().insert({
                    'match_date': '-.-.- -:-',
                    'match_tournament_round': 4,
                    'match_tournament_pair': _model.curentLoopCount,
                    'match_for_tournament': widget.tournamentId,
                    'match_status': 'Соперники не определены',
                    'match_updateted_at':
                        supaSerialize<DateTime>(getCurrentTimestamp),
                    'match_planned_date': '-.-.- -:-',
                  });
                  setState(() {
                    _model.curentLoopCount = _model.curentLoopCount! + 1;
                  });
                }
                setState(() {
                  _model.curentLoopCount = 1;
                });
                await MatchesTable().insert({
                  'match_date': '-.-.- -:-',
                  'match_tournament_round': 5,
                  'match_tournament_pair': _model.curentLoopCount,
                  'match_for_tournament': widget.tournamentId,
                  'match_status': 'Соперники не определены',
                  'match_updateted_at':
                      supaSerialize<DateTime>(getCurrentTimestamp),
                  'match_planned_date': '-.-.- -:-',
                });
                await MatchesTable().insert({
                  'match_date': '-.-.- -:-',
                  'match_tournament_round': 5,
                  'match_tournament_pair': 2,
                  'match_for_tournament': widget.tournamentId,
                  'match_status': 'Соперники не определены',
                  'match_updateted_at':
                      supaSerialize<DateTime>(getCurrentTimestamp),
                  'match_planned_date': '-.-.- -:-',
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Матчи добавлены',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                setState(() {});
              },
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.shuffle_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    color: Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableController1,
                      child: ExpandablePanel(
                        header: Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.infoCircle,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Основная информация',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.network(
                                          _model.tournamentLogo,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.tournamentLogo ==
                                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMedia(
                                            storageFolderPath:
                                                'tournamentLogos',
                                            maxWidth: 150.00,
                                            maxHeight: 150.00,
                                            imageQuality: 100,
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: false,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
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
                                              showUploadMessage(
                                                  context, 'Success!');
                                            } else {
                                              setState(() {});
                                              showUploadMessage(context,
                                                  'Failed to upload data');
                                              return;
                                            }
                                          }

                                          setState(() {
                                            _model.tournamentLogo =
                                                valueOrDefault<String>(
                                              _model.uploadedFileUrl,
                                              '0',
                                            );
                                          });
                                        },
                                        text: 'Загрузить ',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    color: Color(0xFF5C676E),
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.tournamentLogo !=
                                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await deleteSupabaseFileFromPublicUrl(
                                              _model.tournamentLogo);
                                          setState(() {
                                            _model.tournamentLogo =
                                                'https://supabase.proplayclub.ru/storage/v1/object/public/playground/image-7XR1sw6U--transformed.png';
                                          });
                                        },
                                        text: 'Удалить',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    color: Color(0xFF5C676E),
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
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
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: TextFormField(
                                            controller:
                                                _model.tournamentNameController,
                                            focusNode:
                                                _model.tournamentNameFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Название',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .tournamentNameControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: TextFormField(
                                              controller: _model
                                                  .tournamentTagController,
                                              focusNode:
                                                  _model.tournamentTagFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Тэг',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Cabin Condensed',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 0.0,
                                                            0.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .tournamentTagControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: wrapWithModel(
                                                model:
                                                    _model.countryPickerModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CountryPickerWidget(
                                                  selectedCountry: FFAppState()
                                                      .tournaments[widget
                                                          .tournamentIndedx]
                                                      .tournamentCountry,
                                                  selectedFlag: FFAppState()
                                                      .tournaments[widget
                                                          .tournamentIndedx]
                                                      .tournamentFlag,
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
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    color: Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableController2,
                      child: ExpandablePanel(
                        header: Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.users,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Участники турнира',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final tournamentItem = FFAppState()
                                  .tournaments
                                  .where((e) =>
                                      e.tournamentId == widget.tournamentId)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: tournamentItem.length,
                                itemBuilder: (context, tournamentItemIndex) {
                                  final tournamentItemItem =
                                      tournamentItem[tournamentItemIndex];
                                  return ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/811/600',
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Hello World',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    'Hello World',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 20.0,
                                                          height: 12.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              'https://picsum.photos/seed/728/600',
                                                              width: 20.0,
                                                              height: 12.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Hello World',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: 'Отмена',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await TournamentsTable().update(
                              data: {
                                'tournament_created_at':
                                    supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                'tournament_name':
                                    _model.tournamentNameController.text,
                                'tournament_tag':
                                    _model.tournamentTagController.text,
                                'tournament_logo': _model.tournamentLogo,
                                'tournament_flag':
                                    _model.countryPickerModel.selectedFlag,
                                'tournament_country':
                                    _model.countryPickerModel.selectedCountry,
                                'tournament_creator': currentUserUid,
                              },
                              matchingRows: (rows) => rows.eq(
                                'tournament_id',
                                FFAppState()
                                    .tournaments[widget.tournamentIndedx]
                                    .tournamentId,
                              ),
                            );

                            context.pushNamed('TOURNAMENTS');
                          },
                          text: 'Сохранить',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
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
