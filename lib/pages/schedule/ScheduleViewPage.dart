import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterintexspa/pages/schedule/ScheduleListViewPage.dart';

class ScheduleViewPage extends StatefulWidget {

  @override
  _ScheduleViewPageState createState() => _ScheduleViewPageState();
}

class _ScheduleViewPageState extends State<ScheduleViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pic_purespa_bg.png"),
            fit: BoxFit.cover,
         ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 120,
                    width: 130,
                    alignment: Alignment.center,
                    child: Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      child: Image.asset("images/icon_task_head.png"),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () {
                                  BotToast.showText(text: "Heat Schedule click");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleListViewPage()));
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red[200],width: 1.0)
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70.0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 60,
                                            height: 60,
                                            margin: EdgeInsets.all(10.0),
                                            child: Image.asset("images/functionbtn_heat_highlight.png"),
                                          ),
                                          Text("Heat Schedule", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              width: 50,
                                              height: 50,
                                              margin: EdgeInsets.all(10.0),
                                              child: Image.asset("images/icon_goto.png"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () {
                                  BotToast.showText(text: "Filter Schedule click");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleListViewPage()));
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red[200],width: 1.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70.0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 60,
                                            height: 60,
                                            margin: EdgeInsets.all(10.0),
                                            child: Image.asset("images/functionbtn_filter_highlight.png"),
                                          ),
                                          Text("Filter Schedule", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              width: 50,
                                              height: 50,
                                              margin: EdgeInsets.all(10.0),
                                              child: Image.asset("images/icon_goto.png"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () {
                                  BotToast.showText(text: "Sanitizer Schedule click");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleListViewPage()));
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red[200],width: 1.0)
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70.0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 60,
                                            height: 60,
                                            margin: EdgeInsets.all(10.0),
                                            child: Image.asset("images/functionbtn_sanitizer_highlight.png"),
                                          ),
                                          Text("Sanitizer Schedule", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              width: 50,
                                              height: 50,
                                              margin: EdgeInsets.all(10.0),
                                              child: Image.asset("images/icon_goto.png"),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}