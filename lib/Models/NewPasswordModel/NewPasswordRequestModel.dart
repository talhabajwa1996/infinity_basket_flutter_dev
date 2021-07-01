class NewPasswordRequestModel {
  Forget forget;

  NewPasswordRequestModel({this.forget});

  NewPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    forget =
    json['forget'] != null ? new Forget.fromJson(json['forget']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forget != null) {
      data['forget'] = this.forget.toJson();
    }
    return data;
  }
}

class Forget {
  String phone;
  String password;

  Forget({this.phone, this.password});

  Forget.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}