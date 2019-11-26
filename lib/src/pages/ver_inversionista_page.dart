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
      body: Center(
        child: Container(
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
                blurRadius: 8.0
              )
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
                      
                    SizedBox(height: 10.0,),
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

        ),
      ),
    );

  }

}