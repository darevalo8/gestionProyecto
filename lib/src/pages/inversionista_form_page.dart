import 'package:flutter/material.dart';
import 'package:integrador/src/providers/users_provider.dart';

class InversionistaFormPage extends StatefulWidget {
  

  _InversionistaFormPageState createState() => _InversionistaFormPageState();
}

class _InversionistaFormPageState extends State<InversionistaFormPage> {

  String empresa, nit, telefono, direccion, username, password, email;
  var userProvider = UserProvider();
  var data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Inversionista'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _textField('empresa'),
              SizedBox(height: 5.0),
              _textField('nit'),
              SizedBox(height: 5.0),
              _textField('telefono'),
              SizedBox(height: 5.0),
              _textField('direccion'),
              SizedBox(height: 5.0),
              _textField('email'),
              SizedBox(height: 5.0),
              _textField('username'),
              SizedBox(height: 5.0),
              _passwordField(),
              SizedBox(height: 5.0),
              _bottom()
            ],
          ),
        ),
      ),
    );

  }

  Widget _textField(String field) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        // hintText: "Nombre Usuario",
        labelText: field,
        // prefixIcon: Icon(Icons.people),
      ),
      onChanged: (value) {
        switch (field) {
          case 'empresa':
            this.empresa = value;
            break;
          case 'nit':
            this.nit = value;
            break;
          case 'telefono':
            this.telefono = value;
            break;
          case 'direccion':
            this.direccion = value;
            break;
          case 'email':
            this.email = value;
            break;
          case 'username':
            this.username = value;
            break;
        }
        setState(() {});
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
        var clientData = {
          'nombre': this.empresa,
          'nit': this.nit,
          'telefono': this.telefono,
          'direccion': this.direccion,
          'username': this.username,
          'password': this.password,
          'email': this.email
        };

        if(this.empresa.isEmpty || this.nit.isEmpty || this.telefono.isEmpty || this.direccion.isEmpty || this.username.isEmpty || this.password.isEmpty || this.email.isEmpty ){

          mostrarAlerta(context, "Debes llenar todos los campos");
          
        }
        else {

          userProvider.addInversionista(data, clientData);
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
            'Añadir',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
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

}