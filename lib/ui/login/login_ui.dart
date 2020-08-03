import 'package:MilletFlutterApp/constant/app_colors.dart';
import 'package:MilletFlutterApp/constant/app_images.dart';
import 'package:MilletFlutterApp/ui/login/login_vm.dart';
import 'package:MilletFlutterApp/util/screen_util.dart';
import 'package:MilletFlutterApp/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController _nameController;
  TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(); //初始化控制器
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginVModel>.value(
      //根据Provider的model数据变化,变化 - 消费者模式,
        value: LoginVModel(), //
        child: Consumer<LoginVModel>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.color_0a0d22,
              body: Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.login_bg),
                        fit: BoxFit.cover
                    )
                ),
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //背景图
                          margin: EdgeInsets.only(top: Screen.h(400)),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            child: Image.asset(
                              AppImages.logo_login,
                              width: Screen.w(400),
                              height: Screen.w(400),
                            ),
                            onTap: () {
                              Fluttertoast.showToast(msg: '点击了logo');
                            },
                          ),
                        ),
                        SizeSpace(height: 100),

                        /// 输入框
                        /// 用户名
                        Container(
                          height: Screen.h(120),
                          margin: EdgeInsets.only(
                              left: Screen.w(45), right: Screen.w(45)),
                          decoration: BoxDecoration(
                              color: AppColors.color_F8F7FC,
                              borderRadius: BorderRadius.circular(63)),
                          child: TextFormField(
                            validator: (value) {
                              return value.length > 6 ? "用户名长度不能超过6位" : null;
                            },
                            autovalidate: true,
                            controller: _nameController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: Screen.w(45)),
                                border: InputBorder.none,
                                hintText: "请输入用户名",
                                hintStyle: TextStyle(
                                    fontSize: Screen.sp(43),
                                    color: AppColors.color_CCCCCC)),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizeSpace(height: 20),

                        /// 密码
                        Container(
                          height: Screen.h(120),
                          margin: EdgeInsets.only(
                              left: Screen.w(45), right: Screen.w(45)),
                          decoration: BoxDecoration(
                              color: AppColors.color_F8F7FC,
                              borderRadius: BorderRadius.circular(63)),
                          child: TextFormField(
                            validator: (value) {
                              return value.length > 6 ? "密码长度不能超过6位" : null;
                            },
                            autovalidate: true,
                            controller: _passController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: Screen.w(45)),
                                border: InputBorder.none,
                                hintText: "请输入密码",
                                hintStyle: TextStyle(
                                    fontSize: Screen.sp(43),
                                    color: AppColors.color_CCCCCC)),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizeSpace(height: 120),
                        GestureDetector(
                          //手势检测
                          child: Container(
                            margin: EdgeInsets.all(Screen.w(45)),
                            alignment: Alignment.center,
                            width: Screen.w(),
                            height: Screen.h(120),
                            child: TextAndStyle(
                                "${model.articleBeanList.isEmpty
                                    ? "立即登录"
                                    : model?.articleBeanList[0]?.name ??
                                    "立即登录"}",
                                AppColors.color_FFFFFF,
                                40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(63.0),
                                gradient: LinearGradient(colors: [
                                  //渐变色
                                  AppColors.color_3577ec,
                                  AppColors.color_2d84eb
                                ])),
                          ),
                          onTap: () {
                            model.login(context, _nameController.text,
                                _passController.text);
                          },
                        )
                      ],
                    )),
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    //销毁, 释放资源
    _nameController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
