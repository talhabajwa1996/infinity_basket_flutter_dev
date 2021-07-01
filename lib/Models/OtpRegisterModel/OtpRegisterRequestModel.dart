class OtpRegisterRequestModel {
  Verify verify;

  OtpRegisterRequestModel({this.verify});

  OtpRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    verify =
    json['verify'] != null ? new Verify.fromJson(json['verify']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verify != null) {
      data['verify'] = this.verify.toJson();
    }
    return data;
  }
}

class Verify {
  String email;
  String phone;

  Verify({this.email, this.phone});

  Verify.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}