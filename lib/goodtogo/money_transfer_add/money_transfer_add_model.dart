import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoneyTransferAddModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for recieverName widget.
  TextEditingController? recieverNameController1;
  String? Function(BuildContext, String?)? recieverNameController1Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController1;
  String? Function(BuildContext, String?)? recieverPhoneController1Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController2;
  String? Function(BuildContext, String?)? recieverPhoneController2Validator;
  // State field(s) for senderName widget.
  TextEditingController? senderNameController;
  String? Function(BuildContext, String?)? senderNameControllerValidator;
  // State field(s) for senderPhone widget.
  TextEditingController? senderPhoneController1;
  String? Function(BuildContext, String?)? senderPhoneController1Validator;
  // State field(s) for senderPhone widget.
  TextEditingController? senderPhoneController2;
  String? Function(BuildContext, String?)? senderPhoneController2Validator;
  // State field(s) for senderOffice widget.
  String? senderOfficeValue1;
  FormFieldController<String>? senderOfficeValueController1;
  // State field(s) for recieverOffice widget.
  String? recieverOfficeValue1;
  FormFieldController<String>? recieverOfficeValueController1;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for money widget.
  TextEditingController? moneyController;
  String? Function(BuildContext, String?)? moneyControllerValidator;
  // State field(s) for transferID widget.
  TextEditingController? transferIDController;
  String? Function(BuildContext, String?)? transferIDControllerValidator;
  // State field(s) for recieverName widget.
  TextEditingController? recieverNameController2;
  String? Function(BuildContext, String?)? recieverNameController2Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController3;
  String? Function(BuildContext, String?)? recieverPhoneController3Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController4;
  String? Function(BuildContext, String?)? recieverPhoneController4Validator;
  // State field(s) for recieverName widget.
  TextEditingController? recieverNameController3;
  String? Function(BuildContext, String?)? recieverNameController3Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController5;
  String? Function(BuildContext, String?)? recieverPhoneController5Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController6;
  String? Function(BuildContext, String?)? recieverPhoneController6Validator;
  // State field(s) for senderOffice widget.
  String? senderOfficeValue2;
  FormFieldController<String>? senderOfficeValueController2;
  // State field(s) for recieverOffice widget.
  String? recieverOfficeValue2;
  FormFieldController<String>? recieverOfficeValueController2;
  // State field(s) for packageType widget.
  String? packageTypeValue;
  FormFieldController<String>? packageTypeValueController;
  DateTime? datePicked2;
  // State field(s) for back widget.
  TextEditingController? backController;
  String? Function(BuildContext, String?)? backControllerValidator;
  // State field(s) for notes widget.
  TextEditingController? notesController;
  String? Function(BuildContext, String?)? notesControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    recieverNameController1?.dispose();
    recieverPhoneController1?.dispose();
    recieverPhoneController2?.dispose();
    senderNameController?.dispose();
    senderPhoneController1?.dispose();
    senderPhoneController2?.dispose();
    moneyController?.dispose();
    transferIDController?.dispose();
    recieverNameController2?.dispose();
    recieverPhoneController3?.dispose();
    recieverPhoneController4?.dispose();
    recieverNameController3?.dispose();
    recieverPhoneController5?.dispose();
    recieverPhoneController6?.dispose();
    backController?.dispose();
    notesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
