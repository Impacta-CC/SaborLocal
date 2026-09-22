import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'tela_endereco_widget.dart' show TelaEnderecoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaEnderecoModel extends FlutterFlowModel<TelaEnderecoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for txt_CEP widget.
  FocusNode? txtCEPFocusNode;
  TextEditingController? txtCEPTextController;
  String? Function(BuildContext, String?)? txtCEPTextControllerValidator;
  String? _txtCEPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CEP is required';
    }

    if (val.length < 8) {
      return 'CEP deve ter 8 digitos ';
    }
    if (val.length > 8) {
      return 'CEP deve ter 8 digitos ';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ViaCEP)] action in txt_CEP widget.
  ApiCallResponse? consultaCEP;
  // State field(s) for txt_logradouro widget.
  FocusNode? txtLogradouroFocusNode;
  TextEditingController? txtLogradouroTextController;
  String? Function(BuildContext, String?)? txtLogradouroTextControllerValidator;
  String? _txtLogradouroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for txt_bairro widget.
  FocusNode? txtBairroFocusNode;
  TextEditingController? txtBairroTextController;
  String? Function(BuildContext, String?)? txtBairroTextControllerValidator;
  String? _txtBairroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for tx_nmr widget.
  FocusNode? txNmrFocusNode;
  TextEditingController? txNmrTextController;
  String? Function(BuildContext, String?)? txNmrTextControllerValidator;
  String? _txNmrTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for txt_complemento widget.
  FocusNode? txtComplementoFocusNode;
  TextEditingController? txtComplementoTextController;
  String? Function(BuildContext, String?)?
      txtComplementoTextControllerValidator;
  // State field(s) for txt_referencia widget.
  FocusNode? txtReferenciaFocusNode;
  TextEditingController? txtReferenciaTextController;
  String? Function(BuildContext, String?)? txtReferenciaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtCEPTextControllerValidator = _txtCEPTextControllerValidator;
    txtLogradouroTextControllerValidator =
        _txtLogradouroTextControllerValidator;
    txtBairroTextControllerValidator = _txtBairroTextControllerValidator;
    txNmrTextControllerValidator = _txNmrTextControllerValidator;
  }

  @override
  void dispose() {
    txtCEPFocusNode?.dispose();
    txtCEPTextController?.dispose();

    txtLogradouroFocusNode?.dispose();
    txtLogradouroTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txNmrFocusNode?.dispose();
    txNmrTextController?.dispose();

    txtComplementoFocusNode?.dispose();
    txtComplementoTextController?.dispose();

    txtReferenciaFocusNode?.dispose();
    txtReferenciaTextController?.dispose();
  }
}
