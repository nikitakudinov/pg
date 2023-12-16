import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'country_picker_model.dart';
export 'country_picker_model.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({
    Key? key,
    this.selectedCountry,
    this.selectedFlag,
  }) : super(key: key);

  final String? selectedCountry;
  final String? selectedFlag;

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  late CountryPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountryPickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.selectedCountry = widget.selectedCountry!;
        _model.selectedFlag = widget.selectedFlag!;
      });
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

    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (_model.selectedButtonVISIBILITY)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {
                  _model.countriesListVISIBILITY = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.selectedFlag != 'false')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              _model.selectedFlag,
                              width: 24.0,
                              height: 16.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Text(
                          _model.selectedCountry,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (_model.countriesListVISIBILITY)
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Builder(
                builder: (context) {
                  final allCountriesList = FFAppState().allCountries.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: allCountriesList.length,
                    itemBuilder: (context, allCountriesListIndex) {
                      final allCountriesListItem =
                          allCountriesList[allCountriesListIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.selectedCountry =
                                allCountriesListItem.ruName;
                            _model.selectedFlag =
                                allCountriesListItem.flagLinkH24;
                            _model.countriesListVISIBILITY = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 3000),
                                      fadeOutDuration:
                                          Duration(milliseconds: 3000),
                                      imageUrl:
                                          allCountriesListItem.flagLinkH24,
                                      width: 24.0,
                                      height: 16.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    allCountriesListItem.ruName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
