import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'tela_gerenciar_end_widget.dart' show TelaGerenciarEndWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TelaGerenciarEndModel extends FlutterFlowModel<TelaGerenciarEndWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for txt_CEP widget.
  FocusNode? txtCEPFocusNode;
  TextEditingController? txtCEPTextController;
  String? Function(BuildContext, String?)? txtCEPTextControllerValidator;
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

  // State field(s) for txt_numero widget.
  FocusNode? txtNumeroFocusNode;
  TextEditingController? txtNumeroTextController;
  String? Function(BuildContext, String?)? txtNumeroTextControllerValidator;
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

  // State field(s) for txt_complemento widget.
  FocusNode? txtComplementoFocusNode;
  TextEditingController? txtComplementoTextController;
  String? Function(BuildContext, String?)?
      txtComplementoTextControllerValidator;
  // State field(s) for txt_referencia widget.
  FocusNode? txtReferenciaFocusNode;
  TextEditingController? txtReferenciaTextController;
  String? Function(BuildContext, String?)? txtReferenciaTextControllerValidator;
  // Stores action output result for [Backend Call - API (CadastraEndereco)] action in But_concluir widget.
  ApiCallResponse? apiResultEndereco;

  @override
  void initState(BuildContext context) {
    txtLogradouroTextControllerValidator =
        _txtLogradouroTextControllerValidator;
    txtBairroTextControllerValidator = _txtBairroTextControllerValidator;
  }

  @override
  void dispose() {
    txtCEPFocusNode?.dispose();
    txtCEPTextController?.dispose();

    txtLogradouroFocusNode?.dispose();
    txtLogradouroTextController?.dispose();

    txtNumeroFocusNode?.dispose();
    txtNumeroTextController?.dispose();

    txtBairroFocusNode?.dispose();
    txtBairroTextController?.dispose();

    txtComplementoFocusNode?.dispose();
    txtComplementoTextController?.dispose();

    txtReferenciaFocusNode?.dispose();
    txtReferenciaTextController?.dispose();
  }
}
