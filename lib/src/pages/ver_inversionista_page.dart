import 'package:flutter/material.dart';


import 'package:integrador/src/models/inversionista_model.dart';


class VerInversionista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    Inversionista inversionista = data;

    return Scaffold(
      appBar: AppBar(
        title: Text(inversionista.nombreInversionista),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
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
                    
                  SizedBox(height: 10.0,),
                  Text("Telefono: "+inversionista.telInversionista,
                  style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10.0,),
                  Text("NIT: "+inversionista.nitInversionista,
                    style: TextStyle(fontSize: 16.0,wordSpacing: 0.3),
                    ),
                  SizedBox(height: 10.0,),
                  Text("Dirección: "+inversionista.direcInversionista,
                  style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );

  }

}