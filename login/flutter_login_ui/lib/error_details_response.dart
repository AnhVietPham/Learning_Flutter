class ErrorDetailsModel {
  final String field;
  final String message;

  ErrorDetailsModel({this.field, this.message});

  factory ErrorDetailsModel.fromJson(Map<String, dynamic> json) => ErrorDetailsModel(
    field: json['field'] == null ? null : json['field'],
    message: json['message'] == null ? null : json['message']
  );

}
