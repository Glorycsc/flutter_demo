import 'dart:async';
import 'dart:convert';

import 'package:MilletFlutterApp/bean/base/base_list_bean.dart';
import 'package:MilletFlutterApp/bean/intext_login_bean.dart';
import 'package:MilletFlutterApp/net/http_manager.dart';
import 'package:MilletFlutterApp/test/article_bean.dart';
import 'package:MilletFlutterApp/test/article_item_bean.dart';
import 'package:MilletFlutterApp/util/log_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiService {
  /// Intex登录
  Future<IntexLoginBean> getAuth() async {
    Map<String, dynamic> _params = Map();
    _params['account'] = 'min.zhu@mobiliya.com';
    _params['password'] = 'QWdyZWVZYUAxMjM=';
    Completer<IntexLoginBean> completer = Completer();
    HttpManager().post(
        url: "api/oauth/auth",
        data: _params,
        successCallback: (value) {
          LogUtil.e("************************************************");
          LogUtil.e(value.toString());
          IntexLoginBean intexLoginBean = IntexLoginBean.fromJson(value);

          LogUtil.e(intexLoginBean.toString());
//          List responseJson = json.decode(json.encode(value));
//          List<ArticleBean> modelTestList = responseJson.map((m) => new ArticleBean.fromJson(m)).toList();
          completer.complete(intexLoginBean);
          Fluttertoast.showToast(msg: value.toString());
        },
        errorCallback: (value) {
          completer.completeError(value.message);
          Fluttertoast.showToast(msg: value.toString());
        },
        tag: "");
    return completer.future;
  }

  Future<List<ArticleBean>> getInfo() async {
    Completer<List<ArticleBean>> completer = Completer();
    HttpManager().get(
        url: "wxarticle/chapters/json",
        successCallback: (value) {
          List responseJson = json.decode(json.encode(value));
          List<ArticleBean> modelTestList =
              responseJson.map((m) => new ArticleBean.fromJson(m)).toList();
          completer.complete(modelTestList);
        },
        errorCallback: (value) {
          completer.completeError(value.message);
        },
        tag: "");
    return completer.future;
  }

  /// 列表
  Future<List<ArticleItemBean>> getArticle(Map<String, dynamic> params) async {
    Completer<List<ArticleItemBean>> completer = Completer();
    HttpManager().get(
        url: "/user_article/list/${params["pageNum"]}/json",
        successCallback: (value) {
          Map map = json.decode(json.encode(value));
          BaseListBean baseListBean = BaseListBean.fromJson(map);
          List<ArticleItemBean> modelTestList = baseListBean.datas
              .map((m) => new ArticleItemBean.fromJson(m))
              .toList();
          completer.complete(modelTestList);
        },
        errorCallback: (value) {
          completer.completeError(value.message);
        },
        tag: "");
    return completer.future;
  }
}
