import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'tela_endereco_widget.dart' show TelaEnderecoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaEnderecoModel extends FlutterFlowModel<TelaEnderecoWidget> {
  ///  Local state fields for this page.

  String? rua;

  String? bairro;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txt_CEP widget.
  FocusNode? txtCEPFocusNode;
  TextEditingController? txtCEPTextController;
  String? Function(BuildContext, String?)? txtCEPTextControllerValidator;
  String? _txtCEPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CEP is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ViaCEP)] action in Button widget.
  ApiCallResponse? respostaCEP;
  // State field(s) for txt_logradouro widget.
  FocusNode? txtLogradouroFocusNode;
  TextEditingController? txtLogradouroTextController;
  String? Function(BuildContext, String?)? txtLogradouroTextControllerValidator;
  String? _txtLogradouroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'rua is required';
    }

    return null;
  }

  // State field(s) for txt_ref widget.
  FocusNode? txtRefFocusNode1;
  TextEditingController? txtRefTextController1;
  String? Function(BuildContext, String?)? txtRefTextController1Validator;
  String? _txtRefTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'bairro is required';
    }

    return null;
  }

  // State field(s) for txt_complemento widget.
  FocusNode? txtComplementoFocusNode;
  TextEditingController? txtComplementoTextController;
  String? Function(BuildContext, String?)?
      txtComplementoTextControllerValidator;
  // State field(s) for tx_nmr widget.
  FocusNode? txNmrFocusNode;
  TextEditingController? txNmrTextController;
  String? Function(BuildContext, String?)? txNmrTextControllerValidator;
  String? _txNmrTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Número is required';
    }

    return null;
  }

  // State field(s) for txt_ref widget.
  FocusNode? txtRefFocusNode2;
  TextEditingController? txtRefTextController2;
  String? Function(BuildContext, String?)? txtRefTextController2Validator;

  @override
  void initState(BuildContext context) {
    txtCEPTextControllerValidator = _txtCEPTextControllerValidator;
    txtLogradouroTextControllerValidator =
        _txtLogradouroTextControllerValidator;
    txtRefTextController1Validator = _txtRefTextController1Validator;
    txNmrTextControllerValidator = _txNmrTextControllerValidator;
  }

  @override
  void dispose() {
    txtCEPFocusNode?.dispose();
    txtCEPTextController?.dispose();

    txtLogradouroFocusNode?.dispose();
    txtLogradouroTextController?.dispose();

    txtRefFocusNode1?.dispose();
    txtRefTextController1?.dispose();

    txtComplementoFocusNode?.dispose();
    txtComplementoTextController?.dispose();

    txNmrFocusNode?.dispose();
    txNmrTextController?.dispose();

    txtRefFocusNode2?.dispose();
    txtRefTextController2?.dispose();
  }
}
