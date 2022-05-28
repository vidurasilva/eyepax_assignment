class UserModel {
  UserModel(
      {this.id,
      this.fullName,
      this.email,
      this.mobile,
      this.creatDatetime,
      this.password,
      this.isEnable});
  int? id;
  String? fullName;
  String? email;
  String? mobile;
  String? creatDatetime;
  String? password;
  String? isEnable;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json['id'],
        fullName: json["full_name"],
        email: json["email"],
        mobile: json["user_mobile_number"],
        creatDatetime: json["creat_datetime"],
        password: json["password"],
        isEnable: json["isEnable"] == null ? '1' : json["isEnable"],
      );
  // """CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT,
  //user_full_name TEXT UNIQUE, email TEXT, user_mobile_number TEXT,password TEXT,creat_datetime TEXT,
  //isEnable TEXT)""",

  Map<String, dynamic> toJson() => {
        "user_full_name": fullName,
        "email": email,
        "user_mobile_number": mobile,
        "creat_datetime": creatDatetime,
        "password": password,
        "isEnable": isEnable,
      };
}
