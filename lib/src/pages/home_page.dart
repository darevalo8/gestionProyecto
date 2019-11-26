import 'package:flutter/material.dart';
import 'package:integrador/src/providers/users_provider.dart';

class HomePage extends StatelessWidget{
  UserProvider userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Text('Hola'),
      drawer: _drawer(context),
    );
  }
  
  Widget _drawer(BuildContext context){
    Map<String, dynamic> data =  ModalRoute.of(context).settings.arguments;
    bool isEnable = true;
    if(data['tipo_usuario'] == '2' || data['tipo_usuario'] == '3'){
      isEnable = false;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Daniel Arevalo'),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            title: Text('Gestion de clientes'),
            enabled: isEnable,
            onTap: (){
              Navigator.pushNamed(context, 'cliente', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            title: Text('Gestion de Inversionistas'),
            enabled: isEnable,
            onTap: (){
              Navigator.popAndPushNamed(context, 'inversionista', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            title: Text('Proyectos'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'proyecto', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
        ],
      ),
    );
  }
}