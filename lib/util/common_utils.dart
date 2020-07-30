import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutterintexspa/beans/user_info_token_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'common_color.dart';
import 'common_constant.dart';

class CommonUtils {

  // 返回格式和年月日
  static String returnTimeYMD(String dateTime){
    if(dateTime == null) return "暂无时间";
    return formatDate(DateTime.parse(dateTime),[yyyy, '-', mm, '-', dd]);
  }


  // 返回订单状态字典
  static String getorderStatus(String orderStatus){
    switch(orderStatus){
      case "1":
        return '待结算';
        break;
      case "2":
        return '已结算';
        break;
    }
  }

  // 施工状态字典
  static String getRepairStatus(String repairStatus) {
    switch (repairStatus) {
      case "1":
        return '待派工';
        break;
      case "2":
        return '施工中';
        break;
      case "3":
        return '已完工';
        break;
    }
  }


  // 对象转化Josn
  static String objCoverStr(dynamic data){
    return convert.jsonEncode(data);
  }

  //转化String
  static String newStr(Map<String, dynamic> data){
    return convert.jsonEncode(data);
  }

  // 取出来Map 里面不等于空的
  static Map<String, dynamic> newMap(Map<String, dynamic> data){
    List<String> keys = data.keys.toList();
    Map<String, dynamic> map = {};
    for(String item in keys){
      if(data[item] != null){
        map.putIfAbsent(item, () => data[item]);
      }
    }
    return map;
  }

  // 获取请求头登陆信息
  static Future<Options> getUserfoToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfostr = prefs.getString("userInfo");
    if(userInfostr != null && userInfostr != ''){
      UserInfoTokenModel userInfoTokenModel = UserInfoTokenModel.fromJson(CommonUtils.convertJson(userInfostr));
      var options = Options(
          headers: {
            "Authorization":CommonConstant.http_Authorization_header + " " + userInfoTokenModel.token
          }
      );
      return options;
    }
  }

   // json 转map
  static dynamic convertJson(String json){
    return convert.jsonDecode(json);

  }

  /// 收起键盘
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Function debounce(Function fn, [int t = 30]) {
    Timer _debounce;
    return () {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) _debounce.cancel();

      _debounce = Timer(Duration(milliseconds: t), () {
        fn();
      });
    };
  }



  /// 显示对话框
  static void showIosDialog(
  { BuildContext context,
    String content,
    String confirmContent,
    String cancelContent,
    Function cancel,
    Function confirm}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              content,
              style: TextStyle(fontSize: 16, color: Color(CommonColor.c_363638)),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  cancel();
                  Navigator.of(context).pop();
                },
                child: new Text(
                  cancelContent,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () {
                  confirm();
                  Navigator.of(context).pop();
                },
                child: new Text(
                  confirmContent,
                  style: TextStyle(
                      color: Color(CommonColor.c_2e72fa),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        });
  }


  // 自定义 (是否显示红色星,label 标签名称，是否显示后缀)
  static Widget buildCustomInput({bool required,String label, bool suffix,bool isBorder,String suffixName,Widget child,Widget suffixChild}){
    Widget customChild;
    if(suffix && suffixChild != null) {
          customChild = Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  child: child,
                ),
              ),
              Expanded(
                flex: 3,
                child: suffixChild,
              )
            ],
          );
    }else if(!suffix){
      customChild = child;
    }else {
      customChild = Row(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              child: child,
            ),
          ),
          Expanded(
            flex: 1,
            child: new Text(suffixName,style: TextStyle(color: Color(CommonColor.c_a2a2a2),fontSize: ScreenUtil().setSp(14))),
          )
        ],
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
      decoration: BoxDecoration(
          border: isBorder ? Border(
              bottom:  BorderSide(
                  width: isBorder ? ScreenUtil().setHeight(1) : 0,
                  color: Color(CommonColor.c_f2f2f2)
              )
          ) : null
      ),
      height: ScreenUtil().setHeight(44),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 36,
            child: Container(
              child: required ? Row(
                children: <Widget>[
                  new Text("*",style: TextStyle(color: Color(CommonColor.c_ff8939),fontSize: ScreenUtil().setSp(14))),
                  SizedBox(width: ScreenUtil().setWidth(2)),
                  new  Text(label,style: TextStyle(color: Color(CommonColor.c_363638),fontSize: ScreenUtil().setSp(14)))
                ],
              ) :Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  child: new  Text(label,style: TextStyle(color: Color(CommonColor.c_363638),fontSize: ScreenUtil().setSp(14)))
              )  ,
            ),
          ),
          Expanded(
              flex: 64,
              child: Container(
                child: customChild
              ))
        ],
      ),
    );
  }




}


