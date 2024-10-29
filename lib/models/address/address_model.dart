import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/region_model.dart';
import 'package:share_buy/models/address/ward_model.dart';
import 'package:share_buy/models/user/user_model.dart';

class AddressModel {
  String? id;
  ProvinceModel? province;
  DistrictModel? district;
  WardModel? ward;
  String? detail;
  String? phoneNumber;
  RegionModel? region;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? userInfo;

  AddressModel({
    this.id = '',
    required this.province,
    required this.district,
    required this.ward,
    this.detail = '',
    this.phoneNumber = '',
    this.region,
    this.createdAt,
    this.updatedAt,
    this.userInfo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["_id"] ?? '',
        province: json["province"] == null
            ? null
            : ProvinceModel.fromJson(json["province"]),
        district: json["district"] == null
            ? null
            : DistrictModel.fromJson(json["district"]),
        ward: json["ward"] == null ? null : WardModel.fromJson(json["ward"]),
        detail: json["detail"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        region: json["region"] == null
            ? null
            : RegionModel.fromJson(json["region"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userInfo: json["user_info"] == null
            ? null
            : UserModel.fromJson(json["user_info"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province": province?.toJson(),
        "district": district?.toJson(),
        "ward": ward?.toJson(),
        "detail": detail,
        "phone_number": phoneNumber,
        "region": region?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_info": userInfo?.toJson(),
      };
}
