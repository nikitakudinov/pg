import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournamentvieworganizators_model.dart';
export 'tournamentvieworganizators_model.dart';

class TournamentvieworganizatorsWidget extends StatefulWidget {
  const TournamentvieworganizatorsWidget({
    Key? key,
    required this.tournamentId,
  }) : super(key: key);

  final int? tournamentId;

  @override
  _TournamentvieworganizatorsWidgetState createState() =>
      _TournamentvieworganizatorsWidgetState();
}

class _TournamentvieworganizatorsWidgetState
    extends State<TournamentvieworganizatorsWidget> {
  late TournamentvieworganizatorsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentvieworganizatorsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [],
    );
  }
}
