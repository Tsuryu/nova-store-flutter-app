import 'package:flutter/material.dart';
import 'package:nova_store/src/pages/home_page.dart';
import 'package:nova_store/src/pages/login_page.dart';
import 'package:nova_store/src/pages/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'register': (BuildContext context) => RegisterPage(),
  };
}