import 'package:cwc_flutter/form_screen.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARAVINTH CODING FORM',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FormScreen(),
    );
  }
}