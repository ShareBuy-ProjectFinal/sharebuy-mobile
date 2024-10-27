class ProvinceModel {
  num? id;
  String? provinceName;
  String? provinceNameEn;
  String? type;

  ProvinceModel({
    this.id = 0,
    this.provinceName = '',
    this.provinceNameEn = '',
    this.type = '',
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["_id"] ?? 0,
        provinceName: json["province_name"] ?? '',
        provinceNameEn: json["province_name_en"] ?? '',
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province_name": provinceName,
        "province_name_en": provinceNameEn,
        "type": type,
      };
}
