import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const CHANNEL="com.example.project/channels";
  static const patform = const MethodChannel(CHANNEL);
  _openpose() async {
    try{
      await patform.invokeMethod("gopose");
    }on PlatformException catch(e){
      print(e.message);
    }
  }
  _quitpose() async {
  try{
    var result = await patform.invokeMethod("quitpose");
    var data=json.encode(result);
    var url = Uri.http('192.168.0.2:5000','/pyserver');
    var response = await http.post(url, body: data);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }on PlatformException catch(e){
    print(e.message);
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body:Center(
          child: Container(
            child:Center(
                child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 250,),
                      ElevatedButton(
                        onPressed: (){
                          _openpose();
                        },
                        child: Text("go to pose"),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          _quitpose();
                        },
                        child: Text("get data"),
                      ),
                    ]
                ),
            ),
          ),
        ),
      ),
    );
  }
}

