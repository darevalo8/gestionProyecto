import 'package:flutter/material.dart';
import 'package:integrador/src/providers/users_provider.dart';

class InversionistaFormPage extends StatefulWidget {
  @override
  _InversionistaFormPageState createState() => _InversionistaFormPageState();
}

class _InversionistaFormPageState extends State<InversionistaFormPage> {
  String empresa, nit, telefono, direccion, username, password, email;
  String tipoInv;

  List <String> _listaTipo = ['Inversionista', 'Banco',];
 String _opcionSeleccionada = 'Inversionista';

 final scafoldKey = GlobalKey<ScaffoldState>();

  var userProvider = UserProvider();
  var data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir inversionista'),
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
              _tipoField(),
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
  Widget _tipoField() {
    return TextField(

      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Escriba el tipo de inversionista",
          labelText: "tipo inver",
          prefixIcon: Icon(Icons.battery_unknown),
          ),
      onChanged: (value) {
        setState(() {
          this.tipoInv = (value);
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
          'email': this.email,
          'tipo_inver': this.tipoInv
        };
        userProvider.addInversionista(data, clientData);
       
        Navigator.pop(context);
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

  Widget _crearDropdown(){

    return Row(
      children: <Widget>[

        Icon(Icons.select_all),
        Text('Seleccione el ripo de inversionista',),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
            setState(() {

              _opcionSeleccionada= opt;

              if (_opcionSeleccionada == 'Inversionista'){
                opt ='1';
                this.tipoInv = opt;
              }
              if (_opcionSeleccionada == 'Banco'){
                opt ='2';
                this.tipoInv = opt;
              }
              
            });
          },
      ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown () {

    List<DropdownMenuItem<String>> lista = new List();

    _listaTipo.forEach((tipo){

      lista.add(DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
      ));
    });
    return lista;

  }


}