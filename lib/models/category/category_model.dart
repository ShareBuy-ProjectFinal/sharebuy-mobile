class CategoryModel {
  num? id;
  List<num>? children;

  CategoryModel({
    this.id,
    this.children,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        children: json["children"] == null
            ? []
            : List<num>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}
