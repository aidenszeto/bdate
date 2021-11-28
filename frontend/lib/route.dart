import 'package:bdate/pages/setting.dart';

import 'pages/app.dart';
import 'pages/login.dart';
import 'pages/create/required_create.dart';
import 'pages/create/optional_create.dart';

var staticRoutes = {
  "/login": (context) => LoginPage(),
  "/signup": (context) => CreatePage(),
  "/setting": (context) => settingPage(),
};
