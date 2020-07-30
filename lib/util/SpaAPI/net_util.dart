import 'dart:collection';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterintexspa/util/SpaAPI/req_service.dart';
import 'package:flutterintexspa/beans/user_info_token_model.dart';
import 'package:flutterintexspa/util/common_utils.dart';
import 'package:flutterintexspa/route/page_router.dart';
import 'package:flutterintexspa/route/page_routes.dart';

class NetUtil {
  static NetUtil _instance;
  static ReqService _reqService;

//  final baseUrl = "118.190.160.15";
//  final baseUrl = "192.168.0.121";




  NetUtil() {
    var options = BaseOptions(
//        connectTimeout: 15 * 1000, receiveTimeout: 10 * 1000, baseUrl: "http://${baseUrl}:9999"); // TODO baseurl添加
    connectTimeout: 15 * 1000, receiveTimeout: 10 * 1000, baseUrl: "https://intextiotappservice.azurewebsites.net/"); // TODO baseurl添加
    Dio dio = Dio(options);
    dio.interceptors.add(HeadInterceptor());
    _reqService = ReqService(dio);
  }

  static ReqService getInstance() {
    if (_instance == null) {
      _instance = NetUtil();
    }
    return _getReqService();
  }

  static ReqService _getReqService() {
    return _reqService;
  }
}

class HeadInterceptor extends Interceptor {

  @override
  Future onRequest(RequestOptions options) async {
    var headers = HashMap<String, String>();
    headers["Charset"] = "UTF-8";
    headers["Connection"] = "keep-alive";
    headers["Accept"] = "*/*";
    headers["x-platform"] = Platform.isAndroid ? "android" : "ios";
    headers["Content-Type"] = "application/json";

    for(var item in options.headers.keys){
      headers[item] =  options.headers[item];
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfostr = prefs.getString("userInfo");
    if (userInfostr != null && userInfostr != '') {
      UserInfoTokenModel userInfoTokenModel = UserInfoTokenModel.fromJson(
          CommonUtils.convertJson(userInfostr));
      headers["Authorization"] =
           "Bearer " + userInfoTokenModel.token;
    }

    options.headers = headers;
    return super.onRequest(options);
  }

    @override
    Future onResponse(Response response) {
      return super.onResponse(response);
    }
    @override
    Future onError(DioError err) async {
      if(err.response.statusCode == 401){ //token失效跳转到登录页面
        PageRouter.navigatorKey.currentState.pushNamedAndRemoveUntil(RouteConstant.LOGIN_PAGE, (route) => false);
        return NetUtil.getInstance().dio.reject("");
      }
      return super.onError(err);
    }


    Future<void> refreshSuccess(data, String username, String password) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String json = convert.jsonEncode(data);
      prefs.setString("userInfo", json); // 持久化缓存用户信息
      prefs.setString("username", username);
      prefs.setString("password", password);
    }

}