class SignInWithGmailRequestModel {
  GmailUserModel user;

  SignInWithGmailRequestModel({this.user});

  SignInWithGmailRequestModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new GmailUserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class GmailUserModel {
  String firstName;
  String lastName;
  String email;

  GmailUserModel({this.firstName, this.lastName, this.email});

  GmailUserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}