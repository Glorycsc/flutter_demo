import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginState();
  }
}

class _loginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<Login>.value(
      value:LoginModel
    )
  }
}
