
import 'package:NMSL/network/connect.dart';
import 'package:flutter/material.dart';
import 'package:NMSL/UrlLaunch.dart';
import 'package:connectivity/connectivity.dart';
import 'package:NMSL/generated/l10n.dart';
import 'package:NMSL/providers/changeLanguage.dart';
import 'package:provider/provider.dart';
import 'package:NMSL/utils/imageDowload.dart';
import 'package:flustars/flustars.dart';
import 'package:permission_handler/permission_handler.dart';
class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('首頁'),
        ],
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String groupValue = 'zh';
  String url = 'https://static-cdn.jtvnw.net/jtv_user_pictures/23086aa5-9d4d-4b92-b64f-202c88d2845d-profile_image-300x300.png';
  final _snackBar = SnackBar(
      content: Text('已下載')
  );

  void _changed(value) {
    if (value != null) {
      setState(() {
        groupValue = value;
        if (value == "zh") Provider.of<LanguageProvider>(context, listen: false).changeMode("zh");
        if (value == "en") Provider.of<LanguageProvider>(context, listen: false).changeMode("en");
        SpUtil.putString("language", groupValue);
      });
    }
    print(groupValue);
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }



  @override
  void initState(){
    super.initState();
    NetworkConnect.instance.myStream.listen((event) {
      Map<String,bool> connectEvent = event as Map<String,bool>;
      if(!connectEvent['status']!){
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context){
          return AlertDialog(
            title: Center(child:Column(
              children: [
                Icon(Icons.perm_scan_wifi,color: Colors.red,),
                Text('已中斷網路連線'),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Center(child: Text('已重新連接'),),
                onPressed: () async{
                  if(NetworkConnect.checkConnection(event: await Connectivity().checkConnectivity())){
                    Navigator.of(context).pop(true);
                  } else {}
                },
              ),
            ],
          );
        },);
      }else{}
    });
    NetworkConnect.instance.init();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Center(
            child: InkWell(
              onTap: ()async{
                UrlLaunch().urlLaunch('https://www.pressplay.cc/');
              },
              child: Text('超連結點擊'),
            ),
          ),
          Text(S.of(context).test),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).test),
              RadioListTile<String>(
                title: Text('中文'),
                value: 'zh',
                groupValue: groupValue,
                onChanged: _changed,
              ),
              RadioListTile<String>(
                  title: Text('English'),
                  value: 'en',
                  groupValue: groupValue,
                  onChanged: _changed
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.network(url),
          ),
          ElevatedButton(
              onPressed: ()async{save(url: url);await Scaffold.of(context).showSnackBar(_snackBar);},
              child: Text('下載圖片方法1')),
          ElevatedButton(onPressed: ()async{save2(url: url);}, child: Text('下載圖片方法2')),
        ],
      )
      );
  }
}


