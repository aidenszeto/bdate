import 'package:flutter/material.dart';
import 'login.dart';
import 'create.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/': (context) => const LoadingPage(),
    '/create': (context) => const CreatePage(),
    '/login': (context) => const LoginPage(),
  }));
}
