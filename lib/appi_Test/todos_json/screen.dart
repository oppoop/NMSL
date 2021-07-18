import 'package:flutter/material.dart';
import 'utils.dart';
class TodosJson extends StatefulWidget{
  @override
  _TodosJson createState() => _TodosJson();
}
class _TodosJson extends State<TodosJson>
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