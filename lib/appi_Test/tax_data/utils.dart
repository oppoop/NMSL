import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
List<taxdata>? hmApi ;
Future<List<taxdata>?>? futureHm;

Future<List<taxdata>?> ApiHmtest() async{
  try {
    Uri _uri = Uri.parse('https://api.kcg.gov.tw/api/service/get/0223bf7c-21b6-41ba-86e1-23e81969e771');
    final data =  await http.get(_uri);
    if(data.statusCode == 200){
      if(json.decode(data.body)['success']){
        List dk = json.decode(data.body)['data'] as List;
        return dk.map((e) => taxdata.fromJson(e)).toList();
      }
    } else if (data.statusCode == 404){return null;}
    else{return null;}
  }
  catch (e) {
    throw Exception(e);
  }
}

FutureBuilder futureHmapi(){
  return FutureBuilder(
      future: futureHm,
      builder: (context,projectSnap){
        if ((projectSnap.connectionState == ConnectionState.none)||
            (projectSnap.hasData == null)||
            (projectSnap.data == null))
        {return Container();}
        else{
          hmApi= projectSnap.data;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: hmApi!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text('${hmApi![index].datayear}'),
                  subtitle: Text('${hmApi![index].seq}'),
                  trailing: Text('${hmApi![index].tax}'),
                );
              },
            ),
          );
        }
      });
}