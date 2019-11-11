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

  Inversionista({
    this.nombreInversionista,
    this.nitInversionista,
    this.telInversionista,
    this.direcInversionista,
  });

  Inversionista.fromJsonMap(Map<String, dynamic> json) {
    this.nombreInversionista = json['nombre_inversionista'];
    this.nitInversionista = json['nit_inversionista'];
    this.telInversionista = json['tel_inversionista'];
    this.direcInversionista = json['direc_inversionista'];
  }
}