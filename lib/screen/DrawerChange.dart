import 'package:NMSL/utils/pop_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NMSL/providers/loginStatus.dart';
import 'package:NMSL/providers/loginNotify.dart';
import 'package:NMSL/providers/registNotify.dart';
import 'package:NMSL/screen/memberScreen/login.dart';
import 'package:NMSL/screen/memberScreen/regist.dart';
import 'package:NMSL/model/buttonDesign.dart';
import 'package:NMSL/utils/app_libs.dart';
import 'package:NMSL/screen/customerService.dart';

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
              child: Consumer<LoginStatusNotifier>(builder: (
                context,
                status,
                _,
              ) {
                return status.loginStatus ? member() : visitors();
              }),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(child: drawerBottom ? drawerClose() : drawerOpen())
          ],
        ),
      ),
    );
  }

  Widget drawerOpen() {
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
            leading: Icon(Icons.assignment_ind_sharp),
            title: Text(
              '客服系統',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerService()));
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              '語系切換',
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

  Widget drawerClose() {
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

  Widget member() {
    return Consumer<LoginStatusNotifier>(builder: (
      context,
      status,
      _,
    ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  await popWidget.imageViewerDialog(
                    context: context,
                    path:
                        'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: AppLibScreen.imageContent(
                      imageOnePath:
                          'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                    ),
                  ),
                ),
              ),
              /*ClipOval(
                child: Image.network(
                  'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),*/
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
    });
  }

  Widget visitors() {
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
        SizedBox(
          height: 25,
          width: 70,
          child: FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<LoginNotifier>(
                  create: (context) => LoginNotifier(),
                  child: Login(),
                ),
              ),
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
        ),
        SizedBox(
          height: 25,
          width: 70,
          child: FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<RegistNotifier>(
                  create: (context) => RegistNotifier(),
                  child: regist(),
                ),
              ),
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
        ),
      ],
    );
  }
}
