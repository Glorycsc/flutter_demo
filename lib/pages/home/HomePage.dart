import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterintexspa/pages/control/DeviceSpaPage.dart';
import 'package:flutterintexspa/route/bundle.dart';
import 'package:bot_toast/bot_toast.dart';

class HomePage extends StatefulWidget {

  final Bundle bundle;
  HomePage({this.bundle});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();

    fetchData();
    // 初始化数据
    _retrieveIcons();
  }

  fetchData() async {
//    var res = await http.get(url);
//    var decodedJson = jsonDecode(res.body);
//    pokeHub = PokeHub.fromJson(decodedJson);
//    print(pokeHub.toJson());
//    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/head_icon.jpg'), radius: 35.0,),);

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceSpaPage()));
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
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    child: Image.asset("images/icon_spa01.png"),
                  ),
                  Text('questMD01'),
                ],
              ),
            ),
          ),
      );
    }

    return Scaffold(
        appBar: AppBar( //导航栏
          title: Text("My Device"),
          centerTitle: true, // 标题居中
          actions: <Widget>[ //导航栏右侧菜单
            IconButton(icon: Icon(Icons.add), onPressed: () {
              print('添加设备');
              BotToast.showText(text: "功能还在开发中！");
            }),
          ],
        ),
        body: Container(
//          child: Column(
//            children: <Widget>[
//              Stack(
//
//              ),

              child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                        title: Text('My Device'),
                        backgroundColor: Colors.white,
                        onExpansionChanged:(isExpand){
                          print('isExpand====$isExpand');
                        },
                        initiallyExpanded: false,//默认是否展开
                        children: <Widget>[
                          ListTile(
                            title: Text('SPA'),
                            onTap: () {
                              BotToast.showText(text: "点击了SPA");
                            },
                          ),
                          ListTile(
                            title: Text('AGP'),
                            onTap: () {
                              BotToast.showText(text: "点击了AGP");
                            },
                          ),
                          ListTile(
                            title: Text('AIRBED'),
                            onTap: () {
                              BotToast.showText(text: "点击了AIRBED");
                            },
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10
                        ),
                        itemBuilder: (context, i) {
                          return getItemContainer(datas[i]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
//            ],
//          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
//              DrawerHeader(
//                child: Text(' Demo'),
//                decoration: BoxDecoration(
//                  color: Colors.blueGrey,
//                ),
//              ),
              userHeader,
              ListTile(
                title: Text('Contact Infomation'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Reset password'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )

    );//抽屉


  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}