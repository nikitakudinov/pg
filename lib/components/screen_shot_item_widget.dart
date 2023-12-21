import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screen_shot_item_model.dart';
export 'screen_shot_item_model.dart';

class ScreenShotItemWidget extends StatefulWidget {
  const ScreenShotItemWidget({
    Key? key,
    String? screenshotPath,
    int? screenshotNumber,
  })  : this.screenshotPath = screenshotPath ?? '0',
        this.screenshotNumber = screenshotNumber ?? 1,
        super(key: key);

  final String screenshotPath;
  final int screenshotNumber;

  @override
  _ScreenShotItemWidgetState createState() => _ScreenShotItemWidgetState();
}

class _ScreenShotItemWidgetState extends State<ScreenShotItemWidget> {
  late ScreenShotItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenShotItemModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 10.0),
              child: Text(
                'Скриншот ${widget.screenshotNumber.toString()}',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Visibility(
                visible: widget.screenshotPath != '0',
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        widget.screenshotPath,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.screenshotPath == '0')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      storageFolderPath: 'matchScreenshots',
                      imageQuality: 100,
                      mediaSource: MediaSource.photoGallery,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = await uploadSupabaseStorageFiles(
                          bucketName: 'playground',
                          selectedFiles: selectedMedia,
                        );
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    setState(() {
                      _model.screenshotpath = _model.uploadedFileUrl;
                    });
                  },
                  text: 'Загрузить скриншот',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            if (widget.screenshotPath != '0')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await deleteSupabaseFileFromPublicUrl(
                        widget.screenshotPath);
                    setState(() {
                      _model.screenshotpath = _model.uploadedFileUrl;
                    });
                  },
                  text: 'Удалить',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Cabin Condensed',
                          color: Color(0xFF750000),
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
          ],
        ),
      ),
    );
  }
}
