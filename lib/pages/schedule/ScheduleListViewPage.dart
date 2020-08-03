import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterintexspa/pages/schedule/AddScheduleViewPage.dart';

class ScheduleListViewPage extends StatefulWidget {

  @override
  _ScheduleListViewPageState createState() => _ScheduleListViewPageState();
}

class _ScheduleListViewPageState extends State<ScheduleListViewPage> {

  @override
  Widget build(BuildContext context) {
    bool check = true;
    List<String> getDataList() {
      List<String> list = [];
      for (int i = 0; i < 7; i++) {
        list.add(i.toString());
      }
      return list;
    }

    List<String> datas = getDataList();

    Widget getItemContainer(String item) {
      return Card(
        elevation: 20,
//        child: Container(
//          width: 3.0,
//          height: 2.0,
//          alignment: Alignment.center,
//          child: Text(
//            item,
//            style: TextStyle(color: Colors.white, fontSize: 20),
//          ),
//          color: Colors.blue,
//        ),
        child: InkWell(
          onTap: () {
            BotToast.showText(text: "item点击了 ： "+ item);
//            Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceSpaPage()));
          },
          child: Container(
            color: Colors.indigo,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Text("02:25 PM", style: TextStyle(color: Colors.white, fontSize: 15),),
                                Text(
                                  '20 C' ,style: TextStyle(color: Colors.greenAccent, fontSize: 15),),
                                Text("1Hrs", style: TextStyle(color: Colors.greenAccent, fontSize: 13),),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text("Once" ,style: TextStyle(color: Colors.white, fontSize: 12,),textAlign: TextAlign.left,),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Text("2020/07/30", style: TextStyle(color: Colors.white, fontSize: 12),),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Switch(
                  value: check,
                  activeColor: Colors.blue,     // 激活时原点颜色
                  onChanged: (bool val) {
                    this.setState(() {
                      check = !check;
                    });
                  },
                ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      );
    }

//    Row(
//      children: <Widget>[
//        Expanded(
//          child: Row(
//            children: <Widget>[
//              Expanded(
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                      child: Row(
//                        children: <Widget>[
//                          Text("02:25 PM", style: TextStyle(color: Colors.white, fontSize: 15),),
//                          Text(
//                            '20 C' ,style: TextStyle(color: Colors.greenAccent, fontSize: 15),),
//                          Text("1Hrs", style: TextStyle(color: Colors.greenAccent, fontSize: 13),),
//                        ],
//                      ),
//                      flex: 1,
//                    ),
//                    Expanded(
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.end,
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        children: <Widget>[
//                          Text("Once" ,style: TextStyle(color: Colors.white, fontSize: 12),),
//                          Text("2020/07/30"),
//                        ],
//                      ),
//                      flex: 1,
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//          flex: 5,
//        ),

//        Expanded(
//          child: Switch(
//            value: check,
//            activeColor: Colors.blue,     // 激活时原点颜色
//            onChanged: (bool val) {
//              this.setState(() {
//                check = !check;
//              });
//            },
//          ),
//          flex: 1,
//        ),
//      ],
//    ),



    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule List"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            print('添加设备');
            BotToast.showText(text: "添加schedule");
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddScheduleViewPage()));
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 30,
                              width: 100,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text("22 C", style: TextStyle(color: Colors.white, fontSize: 12),),
                                  Text("current temperature", style: TextStyle(color: Colors.white, fontSize: 12),),
                                ],
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("images/functionbtn_heat_highlight.png"),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                              height: 30,
                              width: 100,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text("24 C", style: TextStyle(color: Colors.white, fontSize: 12),),
                                  Text("target temperature", style: TextStyle(color: Colors.white, fontSize: 12),),
                                ],
                              ),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
//                  Container(
//                    height: 10,
//                    width: MediaQuery.of(context).size.width,
//                    child: Row(
//                      children: <Widget>[
//                        Container(
//                          width: 30,
//                          height: 30,
//                          margin: EdgeInsets.all(10),
//                          child: Image.asset("images/"),
//                        ),
//
//                      ],
//                    ),
//                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(2.0),
                        itemExtent: 70.0,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return getItemContainer(datas[index]);
                        },
                      ),
                    ),
                    flex: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}