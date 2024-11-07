import 'dart:developer';

class DistrictModel {
  num? id;
  num? province;
  String? districtName;
  String? districtNameEn;
  String? type;

  DistrictModel({
    this.id = 0,
    this.province = 0,
    this.districtName = '',
    this.districtNameEn = '',
    this.type = '',
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["_id"] ?? 0,
        province: json["province"] ?? 0,
        districtName: json["district_name"] ?? '',
        districtNameEn: json["district_name_en"] ?? '',
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province": province,
        "district_name": districtName,
        "district_name_en": districtNameEn,
        "type": type,
      };
}

extension DistrictExtension on List<DistrictModel> {
  List<DistrictModel> getBySearchName(String search) {
    try {
      if (search.isEmpty) {
        log('empty');
        return this;
      }
      log('where');
      return where((element) => element.districtName!
          .toLowerCase()
          .contains(search.toLowerCase())).toList();
    } catch (e) {
      log('Error getBySearchName: $e');
      return [];
    }
  }
}
