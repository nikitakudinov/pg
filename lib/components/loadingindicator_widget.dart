import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loadingindicator_model.dart';
export 'loadingindicator_model.dart';

class LoadingindicatorWidget extends StatefulWidget {
  const LoadingindicatorWidget({Key? key}) : super(key: key);

  @override
  _LoadingindicatorWidgetState createState() => _LoadingindicatorWidgetState();
}

class _LoadingindicatorWidgetState extends State<LoadingindicatorWidget>
    with TickerProviderStateMixin {
  late LoadingindicatorModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2500.ms,
          begin: 0.0,
          end: 2.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingindicatorModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
      child: Icon(
        FFIcons.kloader5Fill,
        color: FlutterFlowTheme.of(context).success,
        size: 24.0,
      ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
    );
  }
}
