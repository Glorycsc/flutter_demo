import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ScheduleListViewPage extends StatefulWidget {

  @override
  _ScheduleListViewPageState createState() => _ScheduleListViewPageState();
}

class _ScheduleListViewPageState extends State<ScheduleListViewPage> {

  @override
  Widget build(BuildContext context) {

    List<String> getDataList() {
      List<String> list = [];
      for (int i = 0; i < 5; i++) {
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
            color: Colors.blue,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.fiber_manual_record),
                    Text(
                        'ONLINE'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.settings,),
                      ],
                    ),
                  ],
                ),
                Text('questMD01'),
              ],
            ),
          ),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule List"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
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
                        padding: EdgeInsets.all(10.0),
                        itemExtent: 50.0,
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