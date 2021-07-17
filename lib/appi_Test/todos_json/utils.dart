import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
List<TestJson>? datas ;
Future<List<TestJson>?>? futuredata;

Future<List<TestJson>?> Apitest() async{
  try {
    Uri _uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final data =  await http.get(_uri);
    if(data.statusCode == 200){
      List dk =  json.decode(data.body) as List;
      return dk.map((e) => TestJson.fromJson(e)).toList();
    } else if (data.statusCode == 404){return null;}
    else{return null;}
  }
  catch (e) {
    throw Exception(e);
  }
}

FutureBuilder futureBuilder(){
  return FutureBuilder(
      future: futuredata,
      builder: (context,projectSnap){
        if ((projectSnap.connectionState == ConnectionState.none)||
            (projectSnap.hasData == null)||
            (projectSnap.data == null))
        {return Container();}
        else{
          datas = projectSnap.data;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: datas!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text('${datas![index].title}'),
                  subtitle: Text('${datas![index].completed}'),
                );
              },
            ),
          );
        }
      });
}
