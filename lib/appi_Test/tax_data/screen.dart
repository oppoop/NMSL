import 'utils.dart';
import 'package:flutter/material.dart';

class TaxData extends StatefulWidget {
  @override
  _TaxDataState createState() => _TaxDataState();
}

class _TaxDataState extends State<TaxData> {


  @override
  void initState(){
    futureHm = ApiHmtest();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TAX API'),
      ),
      body:futureHmapi(),
    );
  }

}