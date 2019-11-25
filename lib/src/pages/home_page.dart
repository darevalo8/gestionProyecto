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

          ListTile(
            title: Text('Gestion de Inversionistas'),
            onTap: (){
              print('object2');
              Navigator.popAndPushNamed(context, 'inversionista', arguments: data);
            },
          ),
          
        ],
      ),
    );
  }
}