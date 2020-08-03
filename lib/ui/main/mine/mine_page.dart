import 'package:MilletFlutterApp/constant/app_images.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
        body: new Column(
          children: <Widget>[
            new Container(
              child: GestureDetector(
                  child: Text('退出登录'),
                  onTap:(){
                    Navigator.pop(context);
                  }
              ),
            )
          ],
        )
    );
  }
}
