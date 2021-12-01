import 'pages/app.dart';
import 'pages/login.dart';
import 'pages/create/required_create.dart';
import 'pages/create/optional_create.dart';
import 'package:bdate/pages/welcome.dart';

var staticRoutes = {
  "/login": (context) => LoginPage(),
  "/signup": (context) => CreatePage(),
  "/welcome": (context) => WelcomePage(),
};
