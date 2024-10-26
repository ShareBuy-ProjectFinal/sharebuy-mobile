import 'package:share_buy/models/address/region_model.dart';

class AddressModel {
  RegionModel? region;
  int? province;
  int? district;
  int? ward;
  String? detail;
  String? phoneNumber;

  AddressModel({
    this.region,
    this.province = 0,
    this.district = 0,
    this.ward = 0,
    this.detail = '',
    this.phoneNumber = '',
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        region: json["region"] == null
            ? null
            : RegionModel.fromJson(json["region"]),
        province: json["province"] ?? 0,
        district: json["district"] ?? 0,
        ward: json["ward"] ?? 0,
        detail: json["detail"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "region": region?.toJson(),
        "province": province,
        "district": district,
        "ward": ward,
        "detail": detail,
        "phone_number": phoneNumber,
      };
}
