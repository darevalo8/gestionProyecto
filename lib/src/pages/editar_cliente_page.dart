import 'package:flutter/material.dart';
import 'package:integrador/src/Widgets/alertas.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/providers/users_provider.dart';

class EditarCliente extends StatefulWidget {
  @override
  _EditarClienteState createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  @override
  Widget build(BuildContext context) {
  final data = ModalRoute.of(context).settings.arguments;
    Cliente cliente = data;
    return Scaffold(
      appBar: AppBar(
        title: Text(cliente.nombreCliente),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          _crearCard(cliente),
          _crearForm(cliente),
          _crearBoton(cliente),
        ],
      )
    );

  

  }

  Widget _crearCard(Cliente cliente){
   
    return Container(
        height: 170.0,
        margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            radius: 20.0,
                            child: Text(cliente.nombreCliente[0]),
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          cliente.nombreCliente,
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                          )
                      ],
                    ),
                    
                  SizedBox(height: 10.0,),
                  Text("Telefono: "+cliente.telCliente,
                  style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10.0,),
                  Text("NIT del cliente: "+cliente.nitCliente,
                    style: TextStyle(fontSize: 16.0,wordSpacing: 0.3),
                    ),
                  SizedBox(height: 10.0,),
                  Text("Dirección: "+cliente.direcCliente,
                  style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            
          ],
        ),
      );

  }

  Widget _crearForm(Cliente cliente) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _textField("nombre", cliente),
          _textField("nit", cliente),
          _textField("lugar de ubicacion", cliente),
          _textField("telefono", cliente)
        ],
      ),
    );
  }

  Widget _textField(String field, Cliente cliente) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Nuevo "+field,
        labelText: field,
      ),
      onChanged: (value) {
        if(value.length > 0){
          switch (field) {
            case 'telefono':
              cliente.telCliente = value;
              break;
            case 'nit':
              cliente.nitCliente = value;
              break;
            case 'lugar de ubicacion':
              cliente.direcCliente = value;
              break;
            case 'nombre':
              cliente.nombreCliente = value;
              break;
          }
      }
        setState(() {});
      },
    );
  }

  Widget _crearBoton(Cliente cliente) {
    Alerta alerta = new Alerta();
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.blue
      ),
      child: InkWell(
        child: Center(
          child: Text("EDITAR"),
        ),
        onTap: (){
          mostrarAlerta(context, "¿Seguro que quieres editar este cliente?", cliente);
        },
      ),
    );

  }

  void mostrarAlerta(BuildContext context, String mensaje, Cliente cliente){
  
    UserProvider provider = UserProvider();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Verificar peticion'),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Estoy seguro'),
              onPressed: (){
                provider.updateClient(cliente);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),
            )
          ],
        );
      }
    );

}



}