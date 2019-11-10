class Clientes {
  List<Cliente> items = new List();
  Clientes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final cliente = new Cliente.fromJsonMap(item);
      items.add(cliente);
    }
  }
  Clientes();
}

class Cliente {
  String nombreCliente;
  String nitCliente;
  String telCliente;
  String direcCliente;

  Cliente({
    this.nombreCliente,
    this.nitCliente,
    this.telCliente,
    this.direcCliente,
  });

  Cliente.fromJsonMap(Map<String, dynamic> json) {
    this.nombreCliente = json['nombre_cliente'];
    this.nitCliente = json['nit_cliente'];
    this.telCliente = json['tel_cliente'];
    this.direcCliente = json['direc_cliente'];
  }
}
