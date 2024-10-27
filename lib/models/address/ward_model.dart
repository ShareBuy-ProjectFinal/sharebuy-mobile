class WardModel {
  num? id;
  String? wardName;
  String? wardNameEn;
  String? type;

  WardModel({
    this.id = 0,
    this.wardName = '',
    this.wardNameEn = '',
    this.type = '',
  });

  factory WardModel.fromJson(Map<String, dynamic> json) => WardModel(
        id: json["_id"] ?? 0,
        wardName: json["ward_name"] ?? '',
        wardNameEn: json["ward_name_en"] ?? '',
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ward_name": wardName,
        "ward_name_en": wardNameEn,
        "type": type,
      };
}
