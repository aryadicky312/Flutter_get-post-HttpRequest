import 'package:flutter/material.dart';
import 'package:post_method/get_method.dart';
import 'package:post_method/post_method.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostMethod? postMethod;
  GetMethod? getMethod;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Project Flutter API"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Text((getMethod != null) ?
              getMethod!.id + " | " + getMethod!.name
              : "Tidak ada data"),
              InkWell(
                onTap:(){
                  GetMethod.connectToAPI("15").then((value){
                    setState(() {
                      getMethod = value;
                    });
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  color: Colors.blue,
                  child: Text('GET'),
                ),
              )
            ],
          )),
      )
        
    );
  }
}