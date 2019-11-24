import 'package:flutter/material.dart';
import 'package:integrador/src/pages/cliente_form_page.dart';
import 'package:integrador/src/pages/cliente_page.dart';
import 'package:integrador/src/pages/editar_cliente_page.dart';
import 'package:integrador/src/pages/home_page.dart';
import 'package:integrador/src/pages/inversionista_form_page.dart';
import 'package:integrador/src/pages/inversionista_page.dart';
import 'package:integrador/src/pages/login_page.dart';
import 'package:integrador/src/pages/proyecto_form_page.dart';
import 'package:integrador/src/pages/ver_cliente_page.dart';
import 'package:integrador/src/preferencias_usuario/preferencias_usuario.dart';

Future main() async { 

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Proyecto',
      initialRoute: '/',
      routes: {
        '/'                 : (BuildContext context) => LoginPage(),
        'home'              : (BuildContext context) => HomePage(),
        'cliente'           : (BuildContext context) => ClientePage(),
        'add-cliente'       : (BuildContext context) => ClienteFormPage(),
        'verCliente'        : (BuildContext context) => VerCliente(),
        'editarCliente'     : (BuildContext context) => EditarCliente(),
        'inversionista'     : (BuildContext context) => InversionistaPage(),
        'add-inversionista' : (BuildContext context) => InversionistaFormPage(),
        'proyecto'          : (BuildContext context) => ProyectoPage()

      },
    );
  }
}

