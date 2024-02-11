import 'package:driver/view/flash/flash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All One Autos',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins"
      ),
      home: Flash(),
    );
  }
}
