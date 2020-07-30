import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutterintexspa/pages/schedule/ScheduleViewPage.dart';
import 'package:flutterintexspa/views/calculateslider/single_circle_slider.dart';

class DeviceSpaPage extends StatefulWidget {

  @override
  _DeviceSpaPageState createState() => _DeviceSpaPageState();
}

class _DeviceSpaPageState extends State<DeviceSpaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INTEX"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.blur_circular), onPressed: () {
            print('添加设备');
            BotToast.showText(text: "功能还在开发中！");
          }),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pic_purespa_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
//        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 350,
                                  width: 350,
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child: Image.asset("images/pic_spabg_off.png"),
                                ),
                                Positioned(
                                  bottom: 57,
                                  right: 54,
                                  child: Container(
                                    height: 240,
                                    width: 240,
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SingleCircularSlider(
                                        360,
                                        360
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 40,
                                  right: 115,
                                  child: Container(
                                    height: 80,
                                    width: 120,
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: Image.asset("images/btn_spa_off.png"),
                                  ),
                                ),
                                Positioned(
                                  top: 138,
                                  right: 150,
                                  child: Text('questMD02', style: TextStyle(color: Colors.white,
                                      fontSize: 12)),
                                ),
                                Positioned(
                                  bottom: 50,
                                  left: 160,
                                  child: Text('Current', style: TextStyle(color: Colors.white,
                                      fontSize: 12)),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 170,
                                  child: Text('22 C', style: TextStyle(color: Colors.white,
                                      fontSize: 12)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/pic_purespa_bg_1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/pic_purespa_bg_1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Image.asset("images/functionbtn_bubble_normal.png"),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Image.asset("images/functionbtn_jet_normal.png"),
                                ),
                              ),
                              flex: 1,
                            ),

                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Image.asset("images/functionbtn_filter_normal.png"),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Image.asset("images/functionbtn_sanitizer_normal.png"),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 100,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Image.asset("images/functionbtn_heat_normal.png"),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                width: 130,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Image.asset("images/functionbtn_switch_c.png"),
                                ),
                              ),
                              flex: 1,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 300,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          child: FlatButton(
                            color: Colors.blue,
                            highlightColor: Colors.blue[700],
                            colorBrightness: Brightness.dark,
                            splashColor: Colors.grey,
                            child: Text("Schedule"),
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleViewPage()));
                            },
                          ),
                        ),
                      ],
                    ),

                  ),
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}