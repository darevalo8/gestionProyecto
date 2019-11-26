import 'package:flutter/material.dart';
import 'package:integrador/src/models/fases_model.dart';

class FasePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments;
    Fase fase = data;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del proyecto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTitle(fase),
            SizedBox(height: 20),
            _buildCardFecha(fase),
            SizedBox(height: 20),
            SizedBox(height: 20),
            _buildCardDescription(fase),
            SizedBox(height: 20),
            _buildCardEstado(fase),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(Fase fase){
    return Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
                child: Text(
              fase.nombre_fase,
              style: TextStyle(fontSize: 35.0, color: Colors.black),
            )),
          );
  }

  Widget _buildCardFecha(Fase fase) {
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
                    trailing: Text(fase.fecha_inicio),
                    title: Text('fecha_inicio'),
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    trailing: Text(fase.fecha_fin),
                    title: Text('fecha_fin'),
                  ),
                ],
              ),
            ),
          );
  }


  Widget _buildCardDescription(Fase fase) {
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
                  subtitle: Text(fase.descripcion.toLowerCase().replaceRange(0, 1, fase.descripcion[0].toUpperCase())),
                  title: Text('Descripción'),
                )
              ]
            ),
          )
    );
  }

  Widget _buildCardEstado(Fase fase) {

    Icon icono;
    String estadoTemp;
    if(fase.estado == true){
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

}