import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/qr_code_new_package_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PackageAddModel extends FlutterFlowModel {
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
  TextEditingController? senderPhoneController;
  String? Function(BuildContext, String?)? senderPhoneControllerValidator;
  // State field(s) for senderLocation widget.
  TextEditingController? senderLocationController;
  String? Function(BuildContext, String?)? senderLocationControllerValidator;
  // State field(s) for senderOffice widget.
  String? senderOfficeValue1;
  FormFieldController<String>? senderOfficeValueController1;
  // State field(s) for recieverOffice widget.
  String? recieverOfficeValue1;
  FormFieldController<String>? recieverOfficeValueController1;
  // State field(s) for packageType widget.
  String? packageTypeValue1;
  FormFieldController<String>? packageTypeValueController1;
  // State field(s) for breakAble widget.
  String? breakAbleValue;
  FormFieldController<String>? breakAbleValueController;
  DateTime? datePicked1;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for driver widget.
  String? driverValue;
  FormFieldController<String>? driverValueController;
  // State field(s) for back widget.
  TextEditingController? backController1;
  String? Function(BuildContext, String?)? backController1Validator;
  // State field(s) for notes widget.
  TextEditingController? notesController1;
  String? Function(BuildContext, String?)? notesController1Validator;
  // State field(s) for packageIdText widget.
  TextEditingController? packageIdTextController;
  String? Function(BuildContext, String?)? packageIdTextControllerValidator;
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
  String? packageTypeValue2;
  FormFieldController<String>? packageTypeValueController2;
  DateTime? datePicked2;
  // State field(s) for back widget.
  TextEditingController? backController2;
  String? Function(BuildContext, String?)? backController2Validator;
  // State field(s) for notes widget.
  TextEditingController? notesController2;
  String? Function(BuildContext, String?)? notesController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    recieverNameController1?.dispose();
    recieverPhoneController1?.dispose();
    recieverPhoneController2?.dispose();
    senderNameController?.dispose();
    senderPhoneController?.dispose();
    senderLocationController?.dispose();
    backController1?.dispose();
    notesController1?.dispose();
    packageIdTextController?.dispose();
    recieverNameController2?.dispose();
    recieverPhoneController3?.dispose();
    recieverPhoneController4?.dispose();
    recieverNameController3?.dispose();
    recieverPhoneController5?.dispose();
    recieverPhoneController6?.dispose();
    backController2?.dispose();
    notesController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
