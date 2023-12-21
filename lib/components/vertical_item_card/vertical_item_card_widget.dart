import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vertical_item_card_model.dart';
export 'vertical_item_card_model.dart';

class VerticalItemCardWidget extends StatefulWidget {
  const VerticalItemCardWidget({
    Key? key,
    int? imageSize,
    this.imagePath,
    this.flagPath,
    this.country,
  })  : this.imageSize = imageSize ?? 50,
        super(key: key);

  final int imageSize;
  final String? imagePath;
  final String? flagPath;
  final String? country;

  @override
  _VerticalItemCardWidgetState createState() => _VerticalItemCardWidgetState();
}

class _VerticalItemCardWidgetState extends State<VerticalItemCardWidget> {
  late VerticalItemCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerticalItemCardModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: valueOrDefault<double>(
              widget.imageSize.toDouble(),
              50.0,
            ),
            height: valueOrDefault<double>(
              widget.imageSize.toDouble(),
              50.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                'https://picsum.photos/seed/780/600',
                width: valueOrDefault<double>(
                  widget.imageSize.toDouble(),
                  50.0,
                ),
                height: valueOrDefault<double>(
                  widget.imageSize.toDouble(),
                  50.0,
                ),
                fit: BoxFit.cover,
                cacheWidth: 50,
                cacheHeight: 50,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Container(
                      width: 20.0,
                      height: 12.0,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          'https://picsum.photos/seed/520/600',
                          width: 20.0,
                          height: 12.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
