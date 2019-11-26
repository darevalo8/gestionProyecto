import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:integrador/src/models/proyecto_model.dart';
import 'package:integrador/src/preferencias_usuario/preferencias_usuario.dart';

class ProyectoProvider {

  String _url = "proyecto.darevalo.me";
  final _prefs = new PreferenciasUsuario();

  Future<List<Proyecto>> getProyecto() async{

    final url = Uri.http(_url, '/api/proyectos');
    final response = await http.get(url, 
    headers:{ HttpHeaders.authorizationHeader: 'Bearer '+_prefs.token.toString()});

    
    final res = response.statusCode; //200, 401

    if (res == 200){

    final decodeData = jsonDecode(response.body); 
    final proyecto   = Proyectos.jsonFromList(decodeData);

    return proyecto.items;
    }
    if (res == 401){
      return Future.error(res, StackTrace.fromString('Error') );
    }
  }

}