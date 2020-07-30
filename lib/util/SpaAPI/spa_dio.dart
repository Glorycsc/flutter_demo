import 'package:dio/dio.dart';

class SpaDio{

  static getUrl(String url, {Map<String,String> headers}) async{
    try{
      Dio dio = Dio();
      Options options = Options(
        receiveTimeout: 5000,
        sendTimeout: 5000,
      );
      if (headers!=null) options.headers=headers;
        Response res = await dio.get(url,options: options);
        return res;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  static postUrl(String url,{Map<String,String> headers, Map<String,String> params}) async {
    try{
      Dio dio = Dio();
      Options options = Options(
        receiveTimeout: 5000,
        sendTimeout: 5000,
      );
      if (headers!=null) options.headers=headers;
      Response res = await dio.post(url,options: options);
      return res;
    }catch(e){
      return print(e);
    }
  }
}