import 'package:flutter/material.dart';
import 'package:flutterintexspa/beans/user_info_model.dart';
import 'package:flutterintexspa/route/bundle.dart';
import 'package:flutterintexspa/util/SpaAPI/net_util.dart';
import 'package:flutterintexspa/util/SpaAPI/spa_dio.dart';
import 'package:flutterintexspa/util/common_constant.dart';
import 'package:flutterintexspa/util/common_utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterintexspa/route/page_routes.dart';
import 'package:flutterintexspa/route/page_router.dart';
import 'package:flutterintexspa/pages/home/HomePage.dart';

class LoginPage extends StatefulWidget {
  final Bundle bundle;
  LoginPage({this.bundle});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String accountLogo="images/login_logo_account.png";
  String passwordLogo="images/login_logo_password.png";
  final FocusNode _passwordfocusnode = FocusNode();
  String logo;
  String account="";
  String password="";
  @override
  void initState() {
    super.initState();
    logo=accountLogo;
    _passwordfocusnode.addListener(_passwordListener);
  }
  Future<Null> _passwordListener() async {
    if (_passwordfocusnode.hasFocus) {
      logo=passwordLogo;
      setState(() {
      });
    }
    if (!_passwordfocusnode.hasFocus) {
      logo=accountLogo;
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(10, 10, 15, 10),
            child: Text('忘记密码？'),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,//防止软键盘弹出而超出范围
      body: Container(
        color: Color.fromRGBO(234, 234, 234, 1),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Image.asset(logo,gaplessPlayback: true,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: TextEditingController.fromValue(TextEditingValue(
                  text: account,
                  selection: TextSelection.fromPosition(
                    TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: account.length,
                    ),
                  ),
                )),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                obscureText: false, //是否是密码
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "你的手机号/邮箱",
                  icon: Icon(Icons.person_outline),
                ),
                onChanged: (text){
                  setState(() {
                    account=text;
                    print("account"+account);
                  });
                },
              ),
            ),
            Container(//密码输入框
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                focusNode: _passwordfocusnode,
                controller: TextEditingController.fromValue(TextEditingValue(
                  text: password,
                  selection: TextSelection.fromPosition(//保持光标在最后面
                    TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: password.length,
                    ),
                  ),
                )),
                maxLength: 16,
                keyboardType: TextInputType.text,
                obscureText: true,//是否是密码
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                onChanged: (text){
                  setState(() {
                    password=text;
                    print("password "+password);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlineButton(
                    child: Text("注册账号"),
                    borderSide: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    textColor: Colors.pink[300],
                    onPressed: (){

                    },
                  ),
                  FlatButton(
                    child: Text("登录"),
                    color: Colors.pink[300],
                    textColor: Colors.white,
                    onPressed: _login,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async{
    UserInfoModel userInfoModel = UserInfoModel()
    ..account = "min.zhu@mobiliya.com"
    ..password = "QWdyZWVZYUAxMjM=";
    Response response = await login(CommonUtils.newMap(userInfoModel.toJson()));
    print(response);
    if (response.statusCode == 200) {
//      PageRouter.navigatorKey.currentState.pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE, (route) => false);
//      Navigator.pushNamed(context, RouteConstant.HOME_PAGE);
//      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>new HomePage()), (Route<dynamic> rout)=>false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  Future<Response> login(data) async {
    data = CommonUtils.objCoverStr(data);
    BotToast.showLoading();

    Response response = await NetUtil.getInstance().request(CommonConstant.loginApi, method: "post", data: data );
    BotToast.closeAllLoading();
    return response;
  }
}