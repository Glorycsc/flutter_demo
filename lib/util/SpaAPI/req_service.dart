import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

typedef Success = void Function(dynamic json);
typedef Error = void Function(int code, String msg);

///
/// 初步封装网络请求，后期可能做调整
///
class ReqService {
  ReqService(this.dio);

  Dio dio;


  // 新的Dio
  Future<Response> request(String url,{String method,Map<String, dynamic> params, data, Options options}) async {
    Response response;
    try{
      switch(method){
        case "get":
            response = await dio.get(url,queryParameters: params,options: options);
          break;
        case "post":
          response = await dio.post(url,queryParameters: params,data:data,options: options);
          break;
        case "put":
          response = await dio.put(url,queryParameters: params,data:data,options: options);
          break;
        case "delete":
          response = await dio.delete(url,queryParameters: params,data:data,options: options);
          break;
      }
    }catch(err){

    }
    return response;
  }


  void get(String url, {Map<String, dynamic> params, Options options, Success success, Error error}) {
    dio.get(url, queryParameters: params,options: options).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        int code = response.statusCode;
        String msg = response.statusMessage;
        if (error == null) {
          BotToast.showText(text: "服务器开小差了");
        } else {
          error(code, msg);
        }
      }
    }).catchError((er){
      if(er.runtimeType == DioError){
        DioError dioError = er;
        if(dioError.response?.data == null){
          error(500,"系统开了小差,请稍后再试一试");
        }else{
          Map map = dioError.response.data;
          error(map["code"],map["msg"]);
        }
      }

    });
  }

  void post(String url,
      {Map<String, dynamic> params, data, Options options, Success success, Error error}) {
    dio.post(url, data: data ,queryParameters: params,options: options).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
         success(response.data);
        }
      } else {
        int code = response.statusCode;
        String msg = response.statusMessage;
        if (error == null) {
          BotToast.showText(text: "服务器开小差了");
        } else {
          error(code, msg);
        }
      }
    }).catchError((er){
      DioError dioError = er;
      if(dioError.response?.data == null){
          error(500,"系统开了小差,请稍后再试一试");
      }else{
        Map map = dioError.response.data;
        error(map["code"],map["msg"]);
      }
    });
  }


  void put(String url,
      {Map<String, dynamic> params, data, Options options, Success success, Error error}) {
    dio.put(url, data: data ,queryParameters: params,options: options).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        int code = response.statusCode;
        String msg = response.statusMessage;
        if (error == null) {
          BotToast.showText(text: "服务器开小差了");
        } else {
          error(code, msg);
        }
      }
    }).catchError((er){
      DioError dioError = er;
      if(dioError.response?.data == null){
        error(500,"系统开了小差,请稍后再试一试");
      }else{
        Map map = dioError.response.data;
        error(map["code"],map["msg"]);
      }
    });
  }
}
