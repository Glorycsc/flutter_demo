import 'dart:io';
import 'dart:convert';
import 'dart:math';


class GetUtilSpa {

  static getVideoDetailByAid(String aid) async {
    //51639674
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://api.bilibili.cn/view?id=$aid"));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      Map<String, dynamic> jsondata = json.decode(result);
//      VideoItemFromJson itemFromJson = VideoItemFromJson.fromJson(jsondata);
      httpClient.close();
      return null;
    } catch (e) {
      print("请求失败");
    } finally {}
  }
}