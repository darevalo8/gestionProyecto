import 'package:flutter/material.dart';
import 'package:integrador/src/models/inversionista_model.dart';

import 'package:integrador/src/providers/users_provider.dart';

class EditarInversionista extends StatefulWidget {
  @override
  _EditarInversionistaState createState() => _EditarInversionistaState();
}

class _EditarInversionistaState extends State<EditarInversionista> {
  @override
  Widget build(BuildContext context) {
  final data = ModalRoute.of(context).settings.arguments;
    Inversionista inversionista = data;
    return Scaffold(
      appBar: AppBar(
        title: Text(inversionista.nombreInversionista),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          _crearCard(inversionista),
          _crearForm(inversionista),
          _crearBoton(inversionista),
        ],
      )
    );

  

  }

  Widget _crearCard(Inversionista inversionista){
   
    return Container(
        height: 170.0,
        margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF6078ea).withOpacity(.3),
              offset: Offset(0.0, 8.0),
              blurRadius: 8.0)
          ]
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
                            child: Text(inversionista.nombreInversionista[0]),
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          inversionista.nombreInversionista,
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                          )
                      ],
                    ),
                    
                  SizedBox(height: 15.0,),
                  Text("Telefono: "+inversionista.telInversionista,
                  style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10.0,),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("NIT: "+inversionista.nitInversionista,
                          style: TextStyle(fontSize: 16.0,wordSpacing: 0.3),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Text("Dirección: "+inversionista.direcInversionista,
                  style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Icon(Icons.people, size: 70.0,),
            )
          ],
        ),
      );

  }

  Widget _crearForm(Inversionista inversionista) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _textField("nombre", inversionista),
          _textField("nit", inversionista),
          _textField("lugar de ubicacion", inversionista),
          _textField("telefono", inversionista)
        ],
      ),
    );
  }

  Widget _textField(String field, Inversionista inversionista) {
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
              inversionista.telInversionista = value;
              break;
            case 'nit':
              inversionista.nitInversionista = value;
              break;
            case 'lugar de ubicacion':
              inversionista.direcInversionista = value;
              break;
            case 'nombre':
              inversionista.nombreInversionista = value;
              break;
            
          }
      }
        setState(() {});
      },
    );
  }

  Widget _crearBoton(Inversionista inversionista) {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
        )
      ),
      child: InkWell(
        child: Center(
          child: Text("EDITAR", style: TextStyle(fontSize: 20.0),),
        ),
        onTap: (){
          mostrarAlerta(context, "¿Seguro que quieres editar este inversionista?", inversionista);
        },
      ),
    );

  }

  void mostrarAlerta(BuildContext context, String mensaje, Inversionista inversionista){
  
    UserProvider inverProvider = UserProvider();
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
                inverProvider.updateInversionista(inversionista);
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