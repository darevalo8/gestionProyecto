import 'fases_model.dart';

class Proyectos{
  List<Proyecto> items = new List();
  Proyectos.jsonFromList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final proyecto = new Proyecto.fromJsonMap(item);
      items.add(proyecto);
    }
  }
  Proyectos();
}

class Proyecto {

  String nombre_proyecto;
  String fecha_inicio;
  String fecha_fin;
  String cliente;
  String descripcion;
  bool estado;
  List<dynamic> fases;

  Proyecto({
    this.nombre_proyecto,
    this.fecha_inicio,
    this.fecha_fin,
    this.cliente,
    this.descripcion,
    this.estado,
    this.fases
  });

  Proyecto.fromJsonMap(Map <String, dynamic> json){

    this.nombre_proyecto = json['nombre_proyecto'];
    this.fecha_inicio    = json['fecha_inicio'];
    this.fecha_fin       = json['fecha_fin'];
    this.cliente         = json['cliente'];
    this.descripcion     = json['descripcion'];
    this.estado          = json['estado'];
    this.fases           = json['fases'];

  }

}