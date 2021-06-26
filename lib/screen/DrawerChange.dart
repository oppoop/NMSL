import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NMSL/providers/loginStatus.dart';
import 'package:NMSL/providers/loginNotify.dart';
import 'package:NMSL/providers/registNotify.dart';
import 'package:NMSL/screen/memberScreen/login.dart';
import 'package:NMSL/screen/memberScreen/regist.dart';
class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {
  bool drawerBottom = false;
  final double listSize = 20;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginStatusNotifier>(
          create: (context) => LoginStatusNotifier(),
        ),
      ],
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:Consumer<LoginStatusNotifier>(builder:(
                  context,
                  status,
                  _,
                  ){
                return status.loginStatus?member():visitors();
              }),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(
                child: drawerBottom?drawerClose():drawerOpen()
            )
          ],
        ),
      ),
    );

  }

  Widget drawerOpen(){
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              '個人資訊',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              '列表',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(
              'test1',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              'test2',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  Widget drawerClose(){
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              '我已經有帳號了',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              '立即加入 > < ',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  Widget member(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.network(
                'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NMSL',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                    icon: Icon(
                        drawerBottom
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        size: 30,
                        color: Colors.blue),
                    onPressed: () {
                      setState(() {
                        drawerBottom = !drawerBottom;
                      });
                    }))
          ],
        ),
        Row(
          children: [
            Text(
              'yan@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              '@fuckUbitch',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
  Widget visitors(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.network(
                'https://cdn0.popo.tw/uc/default_icons/userpic_L_200x200.jpg',
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
        FlatButton(
          onPressed:()=>Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeNotifierProvider<LoginNotifier>(
              create: (context) => LoginNotifier(),
              child: Login(),
            ),),
          ),
          child: Text("登入"),
          color: Colors.blue,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
        FlatButton(
          onPressed:()=>Navigator.push(context,
            MaterialPageRoute(builder: (context) =>ChangeNotifierProvider<RegistNotifier>(
              create: (context) => RegistNotifier(),
              child:regist(),
            ),),
          ),
          child: Text("註冊"),
          color: Colors.blue,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }
}

