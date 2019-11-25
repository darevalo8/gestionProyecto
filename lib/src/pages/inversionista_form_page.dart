import 'package:flutter/material.dart';
import 'package:integrador/src/providers/users_provider.dart';

class InversionistaFormPage extends StatefulWidget {
  @override
  _InversionistaFormPageState createState() => _InversionistaFormPageState();
}

class _InversionistaFormPageState extends State<InversionistaFormPage> {
  String empresa, nit, telefono, direccion, username, password, email;
  String tipoInv;
  final formKey = GlobalKey<FormState>();
  

  List <String> _listaTipo = ['Seleccione','Inversionista', 'Banco',];
  String _opcionSeleccionada = 'Seleccione';

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _textField('empresa', Icons.store_mall_directory),
                SizedBox(height: 5.0),
                _textField('nit', Icons.assignment_ind),
                SizedBox(height: 5.0),
               _telefonoField(),
                SizedBox(height: 5.0),
                _textField('direccion', Icons.room),
                SizedBox(height: 5.0),
                _emailField(),
                SizedBox(height: 5.0),
                _textField('username', Icons.person),
                SizedBox(height: 5.0),
                _passwordField(),
                SizedBox(height: 5.0),
                _crearDropdown(),
                SizedBox(height: 5.0),
                _bottom()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String field, IconData icon) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
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
      validator: (value){
        if(value.length <=0){
          return 'Rellene los campos';
        }else{
          return null;
        }
      }, 
    );
  }

  Widget _passwordField() {
    return TextFormField(
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
      validator: (value){
        if(value.length <5){
          return 'La contraseña es muy corta';
        }else{
          return null;
        }
      }, 
    );
  }
  Widget _telefonoField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "telefono",
          labelText: "telefono",
          prefixIcon: Icon(Icons.phone),
        ),
      onChanged: (value) {
        setState(() {
          this.telefono = value;
        });
      },
      validator: (value){
        if(value.length <=0){
          return 'Rellene los campos';
        }else{
          return null;
        }
      }, 
    );
  }
  Widget _emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "email",
          labelText: "email",
          prefixIcon: Icon(Icons.mail),
        ),
      onChanged: (value) {
        setState(() {
          this.email = value;
        });
      },
      validator: (value){

        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

        RegExp regExp = new RegExp(pattern);

        if(regExp.hasMatch(value)){
          return null;
        }else{
          return 'el correo no es valido';
        }
      }, 
    );
  }

  
  // Widget _tipoField() {
  //   return TextField(

  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: "Escriba el tipo de inversionista",
  //         labelText: "tipo inver",
  //         prefixIcon: Icon(Icons.battery_unknown),
  //         ),
  //     onChanged: (value) {
  //       setState(() {
  //         this.tipoInv = (value);
  //       });
  //     },
  //   );
  // }

  Widget _bottom() {
    return InkWell(
      onTap: () => _submit(),
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

  void _submit(){

    if(!formKey.currentState.validate() ) return null;


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

  }

  //Snacbar para mostrar algo
   void mostrarSnackBar(String mensaje){

     final snackbar = SnackBar(
       
       content: Text(mensaje),
       duration: Duration(milliseconds: 1500),

     );
     scafoldKey.currentState.showSnackBar(snackbar); 
   }
}