import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('TicTac Toe Game'),
    //   ),
    //   body: Container(
    //     child: Column(
    //       children: <Widget>[
    //         Text('Hello World'),
    //         Icon(Icons.adb_sharp)
    //       ],
    //     ),
    //   ),
    // );
  }
}
