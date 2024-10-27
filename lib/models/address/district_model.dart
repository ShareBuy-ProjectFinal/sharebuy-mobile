class DistrictModel {
  num? id;
  String? districtName;
  String? districtNameEn;
  String? type;

  DistrictModel({
    this.id = 0,
    this.districtName = '',
    this.districtNameEn = '',
    this.type = '',
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["_id"] ?? 0,
        districtName: json["district_name"] ?? '',
        districtNameEn: json["district_name_en"] ?? '',
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "district_name": districtName,
        "district_name_en": districtNameEn,
        "type": type,
      };
}
