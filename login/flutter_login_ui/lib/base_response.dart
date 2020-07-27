import 'package:flutterloginui/error_response.dart';

class BaseResponseModel<T> {
  BaseResponseModel({this.isSuccess, this.errors, this.dataSuccess});

  final bool isSuccess;
  final T dataSuccess;
  final ErrorModel errors;

  factory BaseResponseModel.fromJson(
      Map<String, dynamic> jsonResponse, Function fromJson) {
    return BaseResponseModel<T>(
        isSuccess: jsonResponse['isSuccess'] == null
            ? null
            : jsonResponse['isSuccess'],
        dataSuccess: jsonResponse['data'] == null
            ? null
            : fromJson(jsonResponse['data']),
        errors: jsonResponse['errors'] == null
            ? null
            : ErrorModel.fromJson(jsonResponse['errors']));
  }
}
