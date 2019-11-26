class Fases{
  List<Fase> items = new List();
  Fases.jsonFromList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final fase = new Fase.fromJsonMap(item);
      items.add(fase);
    }
  }
  Fases();
}

class Fase{

  String nombre_fase;
  String fecha_inicio;
  String fecha_fin;
  String descripcion;
  bool estado;

  Fase({
    this.nombre_fase,
    this.fecha_inicio,
    this.fecha_fin,
    this.descripcion,
    this.estado
  });

  Fase.fromJsonMap(Map <String, dynamic> json){

    this.nombre_fase  = json['nombre_fase'];
    this.fecha_inicio = json['fecha_inicio'];
    this.fecha_fin    = json['fecha_fin'];
    this.descripcion  = json['descripcion'];
    this.estado       = json['estado'];

  }

}