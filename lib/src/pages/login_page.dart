import 'package:flutter/material.dart';
import 'package:integrador/src/providers/users_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username, password;
  var userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'GESTION PROYECTO',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'LOGIN',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            _userNameField(),
            SizedBox(
              height: 20.0,
            ),
            _passwordField(),
            SizedBox(
              height: 20.0,
            ),
            _bottom()
          ],
        ),
      ),
    ));
  }

  Widget _userNameField() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Nombre Usuario",
        labelText: "Usuario",
        prefixIcon: Icon(Icons.people),
      ),
      onChanged: (value) {
        setState(() {
          this.username = value;
        });
      },
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Escriba su Contraseña",
          labelText: "Contraseña",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_off),
          )),
      onChanged: (value) {
        setState(() {
          this.password = value;
        });
      },
    );
  }

  Widget _bottom() {
    return InkWell(
      onTap: () {

      if(this.username.isNotEmpty && this.password.isNotEmpty){
        print("username: "+this.username+ " password: "+this.password);
        userProvider.login(this.username, this.password).then((data) {
          if (data['access'] != null) {

             Navigator.pushNamed(context, 'home', arguments: {
              'token': data['access'],
              'refresh': data['refresh']
            });
            } if(data['access'] == null) {
             mostrarAlerta(context, data['detail']);
            }
          });
        }else{
          mostrarAlerta(context, "Debes llenar todos los campos");
        }
      },
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.0),
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        child: Center(
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void mostrarAlerta(BuildContext context, String mensaje){

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('informacion incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );

}