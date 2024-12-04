class CategoryModel {
  num? id;
  List<num>? children;

  CategoryModel({
    this.id = 0,
    this.children = const [],
  });

  // factory CategoryModel.fromJson(Map<String, dynamic> json) =>CategoryModel(
  //       id: json["_id"] ?? 0,
  //       children: json["children"] == null
  //           ? []
  //           : List<num>.from(json["children"]!.map((x) => x)),
  //     );

  factory CategoryModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return CategoryModel();
    }
    return CategoryModel(
      id: json["_id"] ?? 0,
      children: json["children"] == null
          ? []
          : List<num>.from(json["children"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}
