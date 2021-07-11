import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  List<String> _imageList = [];
  int _photoIndex = 0;

  //action sheet
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)}
  ];


  Future _getImage() async {
    Navigator.of(context).pop();
    ImagePicker picker = ImagePicker();
    var image = await picker.getImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);


    if (image != null) {
      await _imageStore();
      setState(() {
        _imageList.add(image.path);
      });
    }
  }


  Future _getActionSheet() async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    setState(() {
                      _photoIndex = i;
                    });
                    _getImage();
                  },
                );
              },
            ),
          );
        });
  }

  _imageStore()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool imagestore = await prefs.setStringList('key', _imageList);
    print(imagestore);
  }
  Future<List<String>> _imageLoad()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imageLoad = prefs.getStringList('key')??[];
    print('test=$imageLoad');
    return imageLoad;
  }

  @override
  void initState() {
    _imageLoad().then((imageLoad) => setState((){
      _imageList = imageLoad;
    }) );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('客服中心'),
      ),
      body: _customService(),
    );
  }

  Widget _customService(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(top:20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 125,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.all(
                    Radius.circular(32) //                 <--- border radius here
                ),
              ),
              child: Center(
                child: _imageList.isNotEmpty
                    ? Wrap(
                  spacing: 10.0,
                  children: _getImageList(),
                )
                    : Text("尚未上傳圖片",style: TextStyle(fontSize: 30,color: Colors.black),),
              )
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text('請選擇回報類型'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  onChanged: null,
                  value: 'screenError',
                  groupValue: '1',
                ),
                Text('畫面異常'),
                Radio<String>(
                  onChanged: null,
                  value: 'MemberReport',
                  groupValue: '1',
                ),
                Text('帳號舉報'),
                Radio<String>(
                  onChanged: null,
                  value: 'others',
                  groupValue: '1',
                ),
                Text('其他'),
              ],
            ),
            RaisedButton(
              child: Text("拍照或上傳"),
              onPressed: () => _getActionSheet(),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              height: 200.0,
              child: DecoratedBox(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  maxLines: null,
                  minLines: null,
                  autofocus: false,
                  expands: true ,
                  style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: '請寫下問題',
                    hintStyle: TextStyle(fontSize: 30,color: Colors.black),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderSide: (BorderSide(color: Colors.black,width: 2)),
                    borderRadius: BorderRadius.circular(32.0)
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                  color: Colors.grey
                ),)
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
              child: Text("送出"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getImageList() {
    return _imageList.map((img) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: <Widget>[
            Image.file(
              File(img),
              fit: BoxFit.cover,
              width: 100.0,
              height: 70.0,
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: GestureDetector(
                child: ClipOval(
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    color: Colors.lightBlue,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _imageList.remove(img);
                  });
                },
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
