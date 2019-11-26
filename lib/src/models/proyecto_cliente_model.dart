import 'fases_model.dart';

class ProyectosCliente{
  List<ProyectoCliente> items = new List();
  ProyectosCliente.jsonFromList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final proyecto = new ProyectoCliente.fromJsonMap(item);
      items.add(proyecto);
    }
  }
  ProyectosCliente();
}

class ProyectoCliente {

  String nombre_proyecto;
  String fecha_inicio;
  String fecha_fin;
  String descripcion;
  bool estado;
  List<dynamic> fases;

  ProyectoCliente({
    this.nombre_proyecto,
    this.fecha_inicio,
    this.fecha_fin,
    this.descripcion,
    this.estado,
    this.fases
  });

  ProyectoCliente.fromJsonMap(Map <String, dynamic> json){

    this.nombre_proyecto = json['nombre_proyecto'];
    this.fecha_inicio    = json['fecha_inicio'];
    this.fecha_fin       = json['fecha_fin'];
    this.descripcion     = json['descripcion'];
    this.estado          = json['estado'];
    this.fases           = json['fases'];

  }

}