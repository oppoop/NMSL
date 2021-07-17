import 'package:flutter/material.dart';
import 'utils.dart';
class todos_json extends StatefulWidget{
  @override
 _todos_json createState() => _todos_json();
}
class _todos_json extends State<todos_json>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuredata = Apitest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: futureBuilder(),
    );
  }
}