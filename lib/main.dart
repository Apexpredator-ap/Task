import 'package:flutter/material.dart';
import 'package:task/view/task.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false,home:  IconDragHomePage(),);
  }
}