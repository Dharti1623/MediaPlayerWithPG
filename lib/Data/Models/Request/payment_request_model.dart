class PaymentRequestModel {
  double? amount;
  String? currency;
  String? receipt;

  PaymentRequestModel({this.amount, this.currency, this.receipt});

  PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    receipt = json['receipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['receipt'] = this.receipt;
    return data;
  }
}
