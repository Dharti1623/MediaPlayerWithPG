import 'package:music_mix/Data/Models/Response/payment_response_data_model.dart';

class PaymentResponseModel {
  String? status;
  var body;
  String? error;

  PaymentResponseModel({this.status, this.body});
  PaymentResponseModel.empty();

  PaymentResponseModel.withError(String errorMessage) {
    error = errorMessage;
  }

  PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new PaymentResponseDataModel.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}
