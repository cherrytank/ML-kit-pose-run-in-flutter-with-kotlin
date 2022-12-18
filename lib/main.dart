import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const CHANNEL="com.example.project/channels";
  static const patform = const MethodChannel(CHANNEL);
  static List<double> data=[];
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
    //data=result;
    print(result);
    //print(result[1100]);
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
                          Timer(Duration(seconds:10), (){
                            _quitpose();
                          });
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

