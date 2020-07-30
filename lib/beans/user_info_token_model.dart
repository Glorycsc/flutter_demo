import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutterintexspa/util/SpaAPI/net_util.dart';
import 'package:flutterintexspa/util/common_utils.dart';
import 'package:flutterintexspa/util/common_constant.dart';

class UserInfoTokenModel {
  String userId;
  String userName;
  String emailAddress;
  String phoneNumber;
  String token;
  String refreshToken;

  UserInfoTokenModel(
      {this.userId,
        this.userName,
        this.emailAddress,
        this.phoneNumber,
        this.token,
        this.refreshToken});

  UserInfoTokenModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['emailAddress'] = this.emailAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }


  Future<Response> login(data) async {
    data = CommonUtils.objCoverStr(data);
    BotToast.showLoading();

    Response response = await NetUtil.getInstance().request(CommonConstant.loginApi, method: "post", data: data );
    BotToast.closeAllLoading();
    return response;
  }
}