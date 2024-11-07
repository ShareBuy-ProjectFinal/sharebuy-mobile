class WardModel {
  num? id;
  num? province;
  num? district;
  String? wardName;
  String? wardNameEn;
  String? type;

  WardModel({
    this.id = 0,
    this.province = 0,
    this.district = 0,
    this.wardName = '',
    this.wardNameEn = '',
    this.type = '',
  });

  factory WardModel.fromJson(Map<String, dynamic> json) => WardModel(
        id: json["_id"] ?? 0,
        province: json["province"] ?? 0,
        district: json["district"] ?? 0,
        wardName: json["ward_name"] ?? '',
        wardNameEn: json["ward_name_en"] ?? '',
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "province": province,
        "district": district,
        "ward_name": wardName,
        "ward_name_en": wardNameEn,
        "type": type,
      };
}

extension WardExtension on List<WardModel> {
  List<WardModel> getBySearchName(String search) {
    return where((element) =>
            element.wardName!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
