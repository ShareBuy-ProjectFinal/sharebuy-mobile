class RegionModel {
  double? latitude;
  double? longitude;

  RegionModel({
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
