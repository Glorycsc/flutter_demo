import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final homescaffoldkey = new GlobalKey<ScaffoldState>(); //key的用法
  DateTime _lastClick; //最后一次按返回

  @override
  void initState() {
    super.initState();
    print(_lastClick);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _checkDoubleClick,
      child: Scaffold(
        key: homescaffoldkey,

        body: Center(
          child: IndexedStack(
              //保存每个页面的状态
        ),
    )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {

    });
  }

  Future<bool> _checkDoubleClick() {
    print("_lastclick $_lastClick");
    print("now ${DateTime.now()}");
    if (_lastClick==null||DateTime.now().difference(_lastClick) >Duration(seconds: 1)) {
      _lastClick = DateTime.now();
      Fluttertoast.showToast(msg: "再按一次退出");
      return Future.value(false);
    }
    else{
      return Future.value(true);
    }
  }
}