import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filed_country_edite_model.dart';
export 'filed_country_edite_model.dart';

class FiledCountryEditeWidget extends StatefulWidget {
  const FiledCountryEditeWidget({
    Key? key,
    required this.field,
    this.initValue,
    required this.dataId,
  }) : super(key: key);

  final String? field;
  final String? initValue;
  final int? dataId;

  @override
  _FiledCountryEditeWidgetState createState() =>
      _FiledCountryEditeWidgetState();
}

class _FiledCountryEditeWidgetState extends State<FiledCountryEditeWidget> {
  late FiledCountryEditeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiledCountryEditeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.jsonCOUNTRIES = await CountryGroup.countriesCall.call();
      if ((_model.jsonCOUNTRIES?.succeeded ?? true)) {
        setState(() {
          FFAppState().updateMAINDATAStruct(
            (e) => e
              ..countries = ((_model.jsonCOUNTRIES?.jsonBody ?? '')
                      .toList()
                      .map<CountrieStruct?>(CountrieStruct.maybeFromMap)
                      .toList() as Iterable<CountrieStruct?>)
                  .withoutNulls
                  .toList(),
          );
        });
      }
    });
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
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.field,
                      'Изменяемое поле',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final countriesList =
                          FFAppState().MAINDATA.countries.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: countriesList.length,
                        itemBuilder: (context, countriesListIndex) {
                          final countriesListItem =
                              countriesList[countriesListIndex];
                          return Container(
                            height: 30.0,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await TeamsTable().update(
                                  data: {
                                    'team_country': countriesListItem.ruName,
                                    'team_flag':
                                        countriesListItem.flagLink48x36,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'team_id',
                                    widget.dataId,
                                  ),
                                );
                                unawaited(
                                  () async {
                                    await action_blocks.teamsupdater(context);
                                    setState(() {});
                                  }(),
                                );

                                context.goNamed(
                                  'TEAM_EDITE',
                                  queryParameters: {
                                    'teamId': serializeParam(
                                      widget.dataId,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        countriesListItem.flagLink48x36,
                                        width: 30.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${countriesListItem.ruName}',
                                        'Название страны',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ]
                  .divide(SizedBox(height: 15.0))
                  .addToStart(SizedBox(height: 20.0))
                  .addToEnd(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
