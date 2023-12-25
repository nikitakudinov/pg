import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vlist_i_t_e_m_model.dart';
export 'vlist_i_t_e_m_model.dart';

class VlistITEMWidget extends StatefulWidget {
  const VlistITEMWidget({
    Key? key,
    int? imageSize,
    this.backgroundColor,
    String? title,
    String? subtitle,
    String? country,
    String? flag,
    String? image,
  })  : this.imageSize = imageSize ?? 35,
        this.title = title ?? '0',
        this.subtitle = subtitle ?? '0',
        this.country = country ?? '0',
        this.flag = flag ?? '0',
        this.image = image ?? '0',
        super(key: key);

  final int imageSize;
  final Color? backgroundColor;
  final String title;
  final String subtitle;
  final String country;
  final String flag;
  final String image;

  @override
  _VlistITEMWidgetState createState() => _VlistITEMWidgetState();
}

class _VlistITEMWidgetState extends State<VlistITEMWidget> {
  late VlistITEMModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VlistITEMModel());
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: Container(
                width: widget.imageSize.toDouble(),
                height: widget.imageSize.toDouble(),
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    widget.image,
                    width: widget.imageSize.toDouble(),
                    height: widget.imageSize.toDouble(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  widget.subtitle,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Container(
                        width: 20.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.flag,
                            width: 20.0,
                            height: 12.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.country,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
