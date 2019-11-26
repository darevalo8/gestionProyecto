import 'package:flutter/material.dart';
import 'package:integrador/src/models/fases_model.dart';
import 'package:integrador/src/models/proyecto_cliente_model.dart';
import 'package:integrador/src/models/proyecto_model.dart';

class VerProyectoCliente extends StatefulWidget {
  @override
  _VerProyectoClienteState createState() => _VerProyectoClienteState();
}

class _VerProyectoClienteState extends State<VerProyectoCliente> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments;
    ProyectoCliente proyecto = data;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del proyecto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTitle(proyecto),
            SizedBox(height: 20),
            _buildCardFecha(proyecto),
            SizedBox(height: 20),
            _buildCardDescription(proyecto),
            SizedBox(height: 20),
            _buildCardEstado(proyecto),
            SizedBox(height: 20),
            _buildCardFases(proyecto),
            SizedBox(height: 20),
          ],
        ),
      ),
    );

  }

  Widget _buildTitle(ProyectoCliente proyecto){
    return Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
                child: Text(
              proyecto.nombre_proyecto,
              style: TextStyle(fontSize: 35.0, color: Colors.black),
            )),
          );
  }

  Widget _buildCardFecha(ProyectoCliente proyecto) {
    return Card(
            borderOnForeground: false,
            elevation: 10.0,
            color: Colors.transparent,
            margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, left: 40.0, bottom: 5.0),
                    child: Text(
                        'FECHA',
                        style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    trailing: Text(proyecto.fecha_inicio),
                    title: Text('fecha_inicio'),
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    trailing: Text(proyecto.fecha_fin),
                    title: Text('fecha_fin'),
                  ),
                ],
              ),
            ),
          );
  }


  Widget _buildCardDescription(ProyectoCliente proyecto) {
    return Card(
          borderOnForeground: false,
          elevation: 10.0,
          color: Colors.transparent,
          margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
              ),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 40.0, bottom: 5.0),
                  child: Text(
                      'DESCRIPCIÓN DEL PROYECTO',
                      style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  subtitle: Text(proyecto.descripcion.toLowerCase().replaceRange(0, 1, proyecto.descripcion[0].toUpperCase())),
                  title: Text('Descripción'),
                )
              ]
            ),
          )
    );
  }

  Widget _buildCardEstado(ProyectoCliente proyecto) {

    Icon icono;
    String estadoTemp;
    if(proyecto.estado == true){
      estadoTemp = 'Activo';
      icono = new Icon(Icons.accessibility_new);
    }else{
      estadoTemp = 'Inactivo';
      icono = new Icon(Icons.airline_seat_individual_suite);
    }

    return Card(
          borderOnForeground: false,
          elevation: 10.0,
          color: Colors.transparent,
          margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
              ),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 40.0, bottom: 5.0),
                  child: Text(
                      'ESTADO DEL PROYECTO',
                      style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: icono,
                  trailing: Text(estadoTemp),
                  title: Text('Estado'),
                )
              ]
            ),
          )
    );    
  }

  Widget _buildCardFases(ProyectoCliente proyecto) {

    return Card(
      borderOnForeground: false,
          elevation: 10.0,
          color: Colors.transparent,
          margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
              ),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 40.0, bottom: 5.0),
                  child: Text(
                      'FASES',
                      style: TextStyle(fontSize: 18.0),
                  ),
                ),
                buildItems(proyecto)
              ]
            ),
          )
    );
  }

  Widget buildItems(ProyectoCliente proyecto){

    List<Widget> lista = new List<Widget>();
    Widget widgetFinal;

    if(proyecto.fases.length != 0){
      for(int i = 0; i<proyecto.fases.length; i++){
        Fase fase = Fase.fromJsonMap(proyecto.fases[i]);
        final widgTemp = new ListTile(
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(fase.nombre_fase),
              leading: Icon(Icons.assignment),
              onTap: (){
                Navigator.popAndPushNamed(context, 'fase', arguments: fase);
              },
            );

        lista.add(widgTemp);
      }
      widgetFinal = new Column(
        children: lista,
      );
    }else{
      widgetFinal = new Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('El proyecto no contiene ninguna fase'),
      );
    }


    return widgetFinal;
  }

  

}
