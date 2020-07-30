class UserInfoModel {
  String account;
  String password;

  UserInfoModel({this.account,
    this.password});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['password'] = this.password;
    return data;
  }
}