import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:integrador/src/helper/helpers.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/models/proyecto_cliente_model.dart';
import 'package:integrador/src/models/proyecto_model.dart';
import 'package:integrador/src/preferencias_usuario/preferencias_usuario.dart';

class ClienteProvider {

  String _url = "proyecto.darevalo.me";
  final _prefs = new PreferenciasUsuario();

  Future<List<Cliente>> getClientes(Map<String, dynamic> data) async {
    // bool logueado = verificarToken(data); 
    //if (log){} retornar el 401 del no log 
    final Helper helper = new Helper();
    final url = Uri.http(_url, '/api/clientes');
    String token = data['token'];
    print(data['token']);
    final response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    final res = response.statusCode; //200, 401

    if (res == 200){
    final decodeData =  jsonDecode(response.body);
    final clientes =  Clientes.fromJsonList(decodeData);
    //helper.verificarToken(token);
    // print(response.statusCode);
    return clientes.items;
    }

    if (res == 401){
      return Future.error(res, StackTrace.fromString('Error') );
    }
    
  }

  Future addClient(Map<String, dynamic> userInfo, Map<String, dynamic> clientData)async{
    final url = Uri.http(_url, '/api/clientes');
    String token = userInfo['token'];
    final response = await http.post(url, body: clientData,headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    // print(response.statusCode);

  }

  Future updateClient(Cliente cliente)async{

    var authData = {
        'nombre'   : cliente.nombreCliente,
        'nit'      : cliente.nitCliente, 
        'telefono' : cliente.telCliente,
        'direccion': cliente.direcCliente
    };

    String token = _prefs.token.toString();
    String id = cliente.id.toString();

    final url = Uri.http(_url, '/api/clientes/$id/');
    final response = await http.put(url, body: authData,
    headers: {HttpHeaders.authorizationHeader : 'Bearer $token'});

  }

  
  Future deleteClient(Cliente cliente) async {

    String id = cliente.id.toString();

    final url = Uri.http(_url, '/api/clientes/$id/');
    final response = await http.delete(url,  headers: {HttpHeaders.contentTypeHeader: 'application/json' ,
    HttpHeaders.authorizationHeader : 'Bearer '+_prefs.token.toString()});

    print(response.statusCode);
  }

  Future<List<ProyectoCliente>> getProyectos() async {

    final url = Uri.http(_url, '/api/proyectos/clientes');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer '+_prefs.token.toString()
    });
    final decodeData = jsonDecode(response.body);
    print(decodeData);
    final proyectos   = ProyectosCliente.jsonFromList(decodeData['clientess']);

    return proyectos.items;

  }

}