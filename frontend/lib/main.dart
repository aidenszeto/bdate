import 'package:flutter/material.dart';
import 'route.dart';
import 'pages/welcome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomePage(),
      routes: staticRoutes,
    );
  }
}