import 'package:flutter/material.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/models/inversionista_model.dart';
import 'package:integrador/src/providers/cliente_provider.dart';
import 'package:integrador/src/providers/users_provider.dart';

class InversionistaPage extends StatefulWidget {
  @override
  _InversionistaPageState createState() => _InversionistaPageState();
}

class _InversionistaPageState extends State<InversionistaPage> {
  final inverProvider = UserProvider();
  //String _opcionSeleccionada = 'Ver inversionista';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Inversionistas'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'add-inversionista', arguments: data);
          },
        ),
        body: _getInversionistas(data));
  }

  Widget _getInversionistas(var data) {
    return FutureBuilder(
      future: inverProvider.getInversionistas(data),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<Inversionista>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final inversionistas = snapshot.data;

        if (inversionistas.length == 0) {
          return Center(
            child: Text('No hay inversionistas'),
          );
        }

        return ListView.builder(
            itemCount: inversionistas.length,
            itemBuilder: (context, i) => Dismissible(
                onDismissed: (value){
                  inverProvider.deleteInversionista(inversionistas[i]);
                } ,
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        subtitle: Text(inversionistas[i].telInversionista),
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(inversionistas[i].nombreInversionista),
                        onTap: () {

                        },
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Ver Inversionista"),
                            onPressed: (){
                              Navigator.pushNamed(context, 'verInversionista', arguments: inversionistas[i]);
                            },
                            textColor: Colors.blue,
                          ),
                          FlatButton(
                            child: Text("Editar inversionista"),
                            onPressed: (){
                              Navigator.pushNamed(context, 'editarInver', arguments: inversionistas[i]);
                            },
                            textColor: Colors.blue,
                          )
                        ],
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
