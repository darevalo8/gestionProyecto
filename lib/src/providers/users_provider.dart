import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/models/inversionista_model.dart';

class UserProvider {
  String _url = "proyecto.darevalo.me";

  Future login(String username, String password) async {
    final url = Uri.http(_url, '/api/login');
    final response = await http
        .post(url, body: {'username': username, 'password': password});
    final decodeData = json.decode(response.body);
    print(response.statusCode);
    // print(decodeData);

    return decodeData;
  }

  Future<List<Cliente>> getClientes(Map<String, dynamic> data) async {
    final url = Uri.http(_url, '/api/clientes');
    String token = data['token'];
    final response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    final decodeData = jsonDecode(response.body);
    final clientes = Clientes.fromJsonList(decodeData);
    print(response.statusCode);
    return clientes.items;
  }

  Future addClient(Map<String, dynamic> userInfo, Map<String, dynamic> clientData)async{
    final url = Uri.http(_url, '/api/clientes');
    String token = userInfo['token'];
    final response = await http.post(url, body: clientData,headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.statusCode);




  }
  Future<List<Inversionista>> getInversionistas(Map<String, dynamic> data) async {
    final url = Uri.http(_url, '/api/clientes');
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
    final url = Uri.http(_url, '/api/clientes');
    String token = userInfo['token'];
    final response = await http.post(url, body: clientData,headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.statusCode);
  }
}
