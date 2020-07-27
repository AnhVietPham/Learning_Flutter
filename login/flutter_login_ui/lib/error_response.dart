import 'package:flutterloginui/error_details_response.dart';

class ErrorModel {
  ErrorModel({this.message, this.errorDetailsModels});

  final String message;
  final List<ErrorDetailsModel> errorDetailsModels;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
      message: json['message'] == null ? null : json['message'],
      errorDetailsModels: json['errorDetails'] == null
          ? null
          : List<ErrorDetailsModel>.from(
              json['errorDetails'].map((x) => ErrorDetailsModel.fromJson(x))));
}
