import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:integrador/src/helper/helpers.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/models/inversionista_model.dart';
import 'package:flutter/material.dart';
import 'package:integrador/src/preferencias_usuario/preferencias_usuario.dart';

class UserProvider {
  
  String _url = "proyecto.darevalo.me";
  final _prefs = new PreferenciasUsuario();

  Future login(String username, String password) async {
    final url = Uri.http(_url, '/api/login');
    final response = await http.post(url, body: {'username': username, 'password': password});
    final decodeData = json.decode(response.body);

    _prefs.token = decodeData['access'];

    return decodeData;
  }

  //----------------------------------------------------------------------------

  Future<List<Cliente>> getClientes(Map<String, dynamic> data) async {
    // bool logueado = verificarToken(data); 
    //if (log){} retornar el 401 del no log 
    final Helper helper = new Helper();
    final url = Uri.http(_url, '/api/clientes');
    String token = data['token'];
    final response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    final decodeData =  jsonDecode(response.body);
    final clientes =  Clientes.fromJsonList(decodeData);
    //helper.verificarToken(token);
    // print(response.statusCode);
    return clientes.items;
    
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

    final authData = {
        "nombre"   : cliente.nombreCliente,
        "nit"      : cliente.nitCliente, 
        "telefono" : cliente.telCliente,
        "dirección": cliente.direcCliente
    };

    print(authData);
    print(_prefs.token);

    String id = cliente.id.toString();
    print(id);
    final url = Uri.http(_url, '/api/clientes/1/');
    final response = await http.put(url, body: authData,
    headers: {HttpHeaders.authorizationHeader : 'Bearer '+_prefs.token.toString()});

    print(response.statusCode);
  }

  //----------------------------------------------------------------------------
  Future<List<Inversionista>> getInversionistas(Map<String, dynamic> data) async {
    final url = Uri.http(_url, '/api/inversionistas');
    String token = data['token'];
    final response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    final decodeData = jsonDecode(response.body);
    final inversionistas = Inversionistas.fromJsonList(decodeData);
    print(response.statusCode);
    return inversionistas.items;
  }

  Future addInversionista(Map<String, dynamic> userInfo, Map<String, dynamic> clientData)async{
    final url = Uri.http(_url, '/api/inversionistas');
    String token = userInfo['token'];
    final response = await http.post(url, body: clientData,headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.statusCode);
  }
}
