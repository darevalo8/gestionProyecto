import 'package:flutter/material.dart';
import 'package:integrador/src/pages/cliente_form_page.dart';
import 'package:integrador/src/pages/cliente_page.dart';
import 'package:integrador/src/pages/home_page.dart';
import 'package:integrador/src/pages/inversionista_form_page.dart';
import 'package:integrador/src/pages/inversionista_page.dart';
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
        'add-cliente': (BuildContext context) => ClienteFormPage(),
        'inversionista': (BuildContext context) => InversionistaPage(),
        'add-inversionista': (BuildContext context) => InversionistaFormPage(),
      },
    );
  }
}

