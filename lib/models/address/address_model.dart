// import 'package:share_buy/models/address/region_model.dart';

// class AddressModel {
//   RegionModel? region;
//   int? province;
//   int? district;
//   int? ward;
//   String? detail;
//   String? phoneNumber;

//   AddressModel({
//     this.region,
//     this.province = 0,
//     this.district = 0,
//     this.ward = 0,
//     this.detail = '',
//     this.phoneNumber = '',
//   });

//   factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
//         region: json["region"] == null
//             ? null
//             : RegionModel.fromJson(json["region"]),
//         province: json["province"] ?? 0,
//         district: json["district"] ?? 0,
//         ward: json["ward"] ?? 0,
//         detail: json["detail"] ?? '',
//         phoneNumber: json["phone_number"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "region": region?.toJson(),
//         "province": province,
//         "district": district,
//         "ward": ward,
//         "detail": detail,
//         "phone_number": phoneNumber,
//       };
// }
class AddressModel {
  String? id;
  ProvinceModel? province;
  DistrictModel? district;
  Ward? ward;
  String? detail;
  String? phoneNumber;
  RegionModel? region;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  UserInfoModel? userInfo;

  AddressModel({
    this.id,
    this.province,
    this.district,
    this.ward,
    this.detail,
    this.phoneNumber,
    this.region,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userInfo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["_id"],
        province: json["province"] == null
            ? null
            : ProvinceModel.fromJson(json["province"]),
        district: json["district"] == null
            ? null
            : DistrictModel.fromJson(json["district"]),
        ward: json["ward"] == null ? null : Ward.fromJson(json["ward"]),
        detail: json["detail"],
        phoneNumber: json["phone_number"],
        region: json["region"] == null
            ? null
            : RegionModel.fromJson(json["region"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userInfo: json["userInfo"] == null
            ? null
            : UserInfoModel.fromJson(json["userInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province": province?.toJson(),
        "district": district?.toJson(),
        "ward": ward?.toJson(),
        "detail": detail,
        "phone_number": phoneNumber,
        "region": region?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "userInfo": userInfo?.toJson(),
      };
}

class DistrictModel {
  int? id;
  String? districtName;
  String? districtNameEn;
  String? type;

  DistrictModel({
    this.id,
    this.districtName,
    this.districtNameEn,
    this.type,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["_id"],
        districtName: json["district_name"],
        districtNameEn: json["district_name_en"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "district_name": districtName,
        "district_name_en": districtNameEn,
        "type": type,
      };
}

class ProvinceModel {
  int? id;
  String? provinceName;
  String? provinceNameEn;
  String? type;

  ProvinceModel({
    this.id,
    this.provinceName,
    this.provinceNameEn,
    this.type,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["_id"],
        provinceName: json["province_name"],
        provinceNameEn: json["province_name_en"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province_name": provinceName,
        "province_name_en": provinceNameEn,
        "type": type,
      };
}

class RegionModel {
  double? latitude;
  double? longitude;

  RegionModel({
    this.latitude,
    this.longitude,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class UserInfoModel {
  String? id;
  String? fullName;
  String? email;

  UserInfoModel({
    this.id,
    this.fullName,
    this.email,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["_id"],
        fullName: json["full_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "full_name": fullName,
        "email": email,
      };
}

class Ward {
  int? id;
  String? wardName;
  String? wardNameEn;
  String? type;

  Ward({
    this.id,
    this.wardName,
    this.wardNameEn,
    this.type,
  });

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        id: json["_id"],
        wardName: json["ward_name"],
        wardNameEn: json["ward_name_en"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ward_name": wardName,
        "ward_name_en": wardNameEn,
        "type": type,
      };
}
