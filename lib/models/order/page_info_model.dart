class PaymentInfoModel {
  String? partnerCode;
  String? orderId;
  String? requestId;
  num? amount;
  num? responseTime;
  String? message;
  num? resultCode;
  String? payUrl;
  String? shortLink;

  PaymentInfoModel({
    this.partnerCode = '',
    this.orderId = '',
    this.requestId = '',
    this.amount = 0,
    this.responseTime = 0,
    this.message = '',
    this.resultCode = 0,
    this.payUrl = '',
    this.shortLink = '',
  });

  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      PaymentInfoModel(
        partnerCode: json["partnerCode"] ?? '',
        orderId: json["orderId"] ?? '',
        requestId: json["requestId"] ?? '',
        amount: json["amount"] ?? 0,
        responseTime: json["responseTime"] ?? 0,
        message: json["message"] ?? '',
        resultCode: json["resultCode"] ?? 0,
        payUrl: json["payUrl"] ?? '',
        shortLink: json["shortLink"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "partnerCode": partnerCode,
        "orderId": orderId,
        "requestId": requestId,
        "amount": amount,
        "responseTime": responseTime,
        "message": message,
        "resultCode": resultCode,
        "payUrl": payUrl,
        "shortLink": shortLink,
      };
}
