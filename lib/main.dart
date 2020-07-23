import 'package:flutter/material.dart';
import 'package:hicoffee/screens/home_screen.dart';
import 'package:hicoffee/screens/loading_screen.dart';
import 'package:hicoffee/screens/custom_drawer_guitar.dart';

void main() { //应用入口
  runApp(MyApp());
}

class MyApp extends StatelessWidget { //StatelessWidget无状态的组件
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    Widget child = HomeScreen(appBar: appBar); //活动区域
    child = CustomGuitarDrawer(child: child); //定义局部变量

    return MaterialApp( //返回组件 - 外部整个tou屏幕
      debugShowCheckedModeBanner: false, //是否显示左上角的debug提示斜线

      theme: ThemeData(
//        scaffoldBackgroundColor: Color(0xFFccffff),
//        scaffoldBackgroundColor: Color(0xFFccebff), // abi kam rang
        scaffoldBackgroundColor: Color(0xFFe6f3ff), //脚手架
//        primaryColor: Color.fromRGBO(212, 244, 255, 1),
//        primaryColor: Color(0xFF80ccff), // abi ye kam por rang
        primaryColor: Color(0xFF99ceff),
        accentColor: Color(0xFF646B86), // 0xFFEB5757 0xFFE8F4F7


      ),
      home: child,
    );
  }
}
