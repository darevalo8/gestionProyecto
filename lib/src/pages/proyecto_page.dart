import 'package:flutter/material.dart';
import 'package:integrador/src/models/proyecto_model.dart';
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
    return FutureBuilder(
      future: proyectoProvider.getProyecto(),
      builder: (context, AsyncSnapshot<List<Proyecto>> snapshot) {
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
