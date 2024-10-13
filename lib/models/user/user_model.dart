class UserModel {
  String? id;
  String? state;
  List<int>? categories;
  String? userName;
  String? fullName;
  String? email;
  dynamic phoneNumber;
  String? role;
  String? image;
  String? firebaseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserModel({
    this.id,
    this.state,
    this.categories,
    this.userName,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.role,
    this.image,
    this.firebaseId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        state: json["state"],
        categories: json["categories"] == null
            ? []
            : List<int>.from(json["categories"]!.map((x) => x)),
        userName: json["user_name"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        image: json["image"],
        firebaseId: json["firebase_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "state": state,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "user_name": userName,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "image": image,
        "firebase_id": firebaseId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
