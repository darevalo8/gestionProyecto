import 'package:flutter/material.dart';
import 'package:integrador/src/models/proyecto_model.dart';

class VerProyecto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments;
    Proyecto proyecto = data;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 10.0,
            margin: EdgeInsets.only(top: 10.0),
            child: Center(child: Text(proyecto.nombre_proyecto)),
          )
        ],
      ),
    );
  }
}
