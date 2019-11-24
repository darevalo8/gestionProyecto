import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
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
    var data =  ModalRoute.of(context).settings.arguments;
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
            onTap: (){
              Navigator.pushNamed(context, 'cliente', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            title: Text('Gestion de Inversionistas'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'inversionista', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            title: Text('Proyectos'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'proyecto');
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
        ],
      ),
    );
  }
}