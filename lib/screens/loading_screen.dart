import 'package:flutter/material.dart';
import 'package:hicoffee/screens/home_screen.dart';
import 'package:hicoffee/screens/custom_drawer_guitar.dart';

class LoadingScreen extends StatefulWidget {

//  final AppBar appBar;
//  LoadingScreen({Key key, @required this.appBar}) : super(key: key);
//
  @override //如果是Stateful的组件必须覆写createState()方法
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    loading();
  }


  //过渡页
  void loading() async{
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
