import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:integrador/src/models/inversionista_model.dart';
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

  Future addInversionista(Map<String, dynamic> userInfo, Map<String, dynamic> inverData)async{
    final url = Uri.http(_url, '/api/inversionistas');
    String token = userInfo['token'];
    final response = await http.post(url, body: inverData,headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    
  }



}
