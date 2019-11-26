import 'package:flutter/material.dart';
import 'package:integrador/src/Widgets/alertas.dart';
import 'package:integrador/src/providers/users_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Alerta alerta = new Alerta();
  String username, password;
  var userProvider = UserProvider();
  bool _guardando = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[_crearFondo(context),_loginForm()],
        )
    );
  }

  Widget _loginForm(){
    return SingleChildScrollView(

          child: Container(
            padding:
                EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
            child: Form(
              key: formKey,
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
                  buildForm(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _botton()
                ],
              ),
            ),
          ),
    );
  }

  Widget _userNameField() {
    return TextFormField(
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
        if(value.length <=0){
          return 'Rellene los campos';
        }else{
          return null;
        }
      }, 
    );
  }

  Widget _botton() {

    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0)
      ),
      color: Colors.transparent,
      onPressed: (_guardando) ? null :_submit,
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.0),
            gradient: LinearGradient(
              colors: <Color>[Color(0xFF17ead9), Color(0xFF6078ea)]
              )    
            ),
        child: Center(
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }



  void _submit(){

    if(!formKey.currentState.validate() ) return null;

    setState(() {_guardando= true; });

    if(this.username.isNotEmpty && this.password.isNotEmpty){
        userProvider.login(this.username, this.password).then((data) {
          if (data['access'] != null) {

             setState(() {_guardando= false ; });
             userProvider.getTypeUser().then((value){
                Navigator.pushReplacementNamed(context, 'home', arguments: {
                'token': data['access'],
                'refresh': data['refresh'],
                'tipo_usuario' : value['tipo_usuario']
              });
             });
             
            } if(data['access'] == null) {
             alerta.mostrarAlerta(context, data['detail']);
            }
          });
        }
        
        // else{
        //   alerta.mostrarAlerta(context, "Debes llenar todos los campos");
        // }
   
  }

  Widget buildForm() {
    return new Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:30.0,
            ),
            _userNameField(),
            SizedBox(
              height: 30.0,
            ),
            _passwordField(),
            SizedBox(
              height: 35.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     Text(
            //       "Forgot Password?",
            //       style: TextStyle(
            //           color: Colors.blue,
            //           fontFamily: "Poppins-Medium",
            //           fontSize: ScreenUtil.getInstance().setSp(28)
            //           ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF17ead9), Color(0xFF6078ea)])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
      ],
    );
  }

}

