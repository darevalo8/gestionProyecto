
import 'package:http/http.dart' as http;


class Helper {

  String _url = "proyecto.darevalo.me";

  Future verificarToken(String token )async{
    final url = Uri.http(_url, '/api/api/token/verify');
    
    final response = await http.post(url, body: token);
    print(response.statusCode);
    
  }
}

