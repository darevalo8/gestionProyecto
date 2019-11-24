class Inversionistas {
  List<Inversionista> items = new List();
  Inversionistas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final inversionista = new Inversionista.fromJsonMap(item);
      items.add(inversionista);
    }
  }
  Inversionistas();
}

class Inversionista {
  String nombreInversionista;
  String nitInversionista;
  String telInversionista;
  String direcInversionista;
  int tipoInver;
  

  Inversionista({
    this.nombreInversionista,
    this.nitInversionista,
    this.telInversionista,
    this.direcInversionista,
    this.tipoInver,
  });

  Inversionista.fromJsonMap(Map<String, dynamic> json) {
    this.nombreInversionista = json['nombre'];
    this.nitInversionista = json['nit'];
    this.telInversionista = json['telefono'];
    this.direcInversionista = json['direccion'];
    this.tipoInver= json["tipo_inver"];
  }
}