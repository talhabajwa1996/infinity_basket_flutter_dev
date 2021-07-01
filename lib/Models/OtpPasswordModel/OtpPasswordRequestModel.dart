class OtpPasswordRequestModel {
  Verify verify;

  OtpPasswordRequestModel({this.verify});

  OtpPasswordRequestModel.fromJson(Map<String, dynamic> json) {
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
  String phone;

  Verify({this.phone});

  Verify.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}