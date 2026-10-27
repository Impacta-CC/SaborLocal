import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_detales_prato_model.dart';
export 'bottom_sheet_detales_prato_model.dart';

class BottomSheetDetalesPratoWidget extends StatefulWidget {
  const BottomSheetDetalesPratoWidget({
    super.key,
    required this.pratoItem,
  });

  final dynamic pratoItem;

  @override
  State<BottomSheetDetalesPratoWidget> createState() =>
      _BottomSheetDetalesPratoWidgetState();
}

class _BottomSheetDetalesPratoWidgetState
    extends State<BottomSheetDetalesPratoWidget> {
  late BottomSheetDetalesPratoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetDetalesPratoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
