import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: ElevatedButton(
              onPressed: (){
                _openpose();
              },
              child: Text("go to pose"),
            ),
          ),
        ),
      ),
    );
  }
}

