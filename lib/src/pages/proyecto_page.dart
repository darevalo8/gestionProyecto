import 'package:flutter/material.dart';
import 'package:integrador/src/models/proyecto_cliente_model.dart';
import 'package:integrador/src/models/proyecto_model.dart';
import 'package:integrador/src/providers/cliente_provider.dart';
import 'package:integrador/src/providers/proyecto_provider.dart';

class ProyectoPage extends StatefulWidget {
  @override
  _ProyectoState createState() => _ProyectoState();
}

class _ProyectoState extends State<ProyectoPage> {
  ProyectoProvider proyectoProvider = ProyectoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus proyectos"),
      ),
      body: _getProyectos(),
    );
  }


  _getProyectos() {

    Map<String, dynamic> data =  ModalRoute.of(context).settings.arguments;
    print(data['tipo_usuario']);
    if(data['tipo_usuario'] == '2'){
      print('sisas');
      return FutureBuilder(
      future: ClienteProvider().getProyectos(),
      builder: (context, AsyncSnapshot<List<ProyectoCliente>> snapshot) {

        if(snapshot.error== 401){
          return Center(
            child: Container(
              child: InkWell(
                child: Center(
                  child: Text('PRECAUCION', style: TextStyle(color: Colors.red, fontSize: 40.0),),
                ),
                onTap:()=> alertaToken(context),
              )
            ),
          );

        }


        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final proyectos = snapshot.data;

        if (proyectos.length == 0) {
          return Center(
            child: Text("No tienes proyectos creados"),
          );
        }

        return ListView.builder(
          itemCount: proyectos.length,
          itemBuilder: (context, i) {
            String estado = 'Proyecto inactivo';
            if (proyectos[i].estado == true) {
              estado = 'Proyecto activo';
            }

            return Card(
              child: ListTile(
                title: Text(proyectos[i].nombre_proyecto),
                subtitle: Text(estado),
                leading: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.popAndPushNamed(context, 'verProyecto', arguments: proyectos[i]);
                },
              ),
            );
          },
        );
      },
    );
    }else{
      return FutureBuilder(
        future: proyectoProvider.getProyecto(),
        builder: (context, AsyncSnapshot<List<Proyecto>> snapshot) {

          if(snapshot.error== 401){
            return Center(
              child: Container(
                child: InkWell(
                  child: Center(
                    child: Text('PRECAUCION', style: TextStyle(color: Colors.red, fontSize: 40.0),),
                  ),
                  onTap:()=> alertaToken(context),
                )
              ),
            );

          }


          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final proyectos = snapshot.data;

          if (proyectos.length == 0) {
            return Center(
              child: Text("No tienes proyectos creados"),
            );
          }

          return ListView.builder(
            itemCount: proyectos.length,
            itemBuilder: (context, i) {
              String estado = 'Proyecto inactivo';
              if (proyectos[i].estado == true) {
                estado = 'Proyecto activo';
              }

              return Card(
                child: ListTile(
                  title: Text(proyectos[i].nombre_proyecto),
                  subtitle: Text(estado),
                  leading: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'verProyecto', arguments: proyectos[i]);
                  },
                ),
              );
            },
          );
        },
      );
    }
  }

  void alertaToken(BuildContext context){
     
     showDialog(
       context: context,
       barrierDismissible: true,
       builder: (context){
         return AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
           title: Text('Titulo'),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text('Su cesion ha expirado'),
               //FlutterLogo(size: 100.0,)
             ],
           ),
           actions: <Widget>[
             FlatButton(
               child: Text('Ok'),
               onPressed: ()=> Navigator.pushReplacementNamed(context, '/'),
             ),
  
           ],
          
         );
       }
     );
  }
}


