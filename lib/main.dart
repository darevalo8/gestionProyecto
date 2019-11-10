import 'package:flutter/material.dart';
import 'package:integrador/src/pages/cliente_page.dart';
import 'package:integrador/src/pages/home_page.dart';
import 'package:integrador/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Proyecto',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'cliente': (BuildContext context) => ClientePage(),
      },
    );
  }
}

