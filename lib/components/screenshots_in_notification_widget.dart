import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screenshots_in_notification_model.dart';
export 'screenshots_in_notification_model.dart';

class ScreenshotsInNotificationWidget extends StatefulWidget {
  const ScreenshotsInNotificationWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
  }) : super(key: key);

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;

  @override
  _ScreenshotsInNotificationWidgetState createState() =>
      _ScreenshotsInNotificationWidgetState();
}

class _ScreenshotsInNotificationWidgetState
    extends State<ScreenshotsInNotificationWidget> {
  late ScreenshotsInNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenshotsInNotificationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 200.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
            child: PageView(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.parameter1,
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.parameter2,
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.parameter3,
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.parameter4,
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.parameter5,
                      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
              child: smooth_page_indicator.SmoothPageIndicator(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                count: 5,
                axisDirection: Axis.horizontal,
                onDotClicked: (i) async {
                  await _model.pageViewController!.animateToPage(
                    i,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                effect: smooth_page_indicator.ExpandingDotsEffect(
                  expansionFactor: 3.0,
                  spacing: 8.0,
                  radius: 16.0,
                  dotWidth: 16.0,
                  dotHeight: 8.0,
                  dotColor: FlutterFlowTheme.of(context).accent1,
                  activeDotColor: FlutterFlowTheme.of(context).primary,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
