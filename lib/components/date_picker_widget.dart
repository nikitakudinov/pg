import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowCalendar(
      color: FlutterFlowTheme.of(context).primary,
      iconColor: FlutterFlowTheme.of(context).secondaryText,
      weekFormat: false,
      weekStartsMonday: false,
      initialDate: getCurrentTimestamp,
      rowHeight: 64.0,
      onChange: (DateTimeRange? newSelectedDate) {
        setState(() => _model.calendarSelectedDay = newSelectedDate);
      },
      titleStyle: FlutterFlowTheme.of(context).headlineSmall,
      dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
      dateStyle: FlutterFlowTheme.of(context).bodyMedium,
      selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
      inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
    );
  }
}
