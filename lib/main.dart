
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_youapp/pages/init_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example",
      home: InitPage(),
    );
  }
}

