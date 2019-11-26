import 'package:flutter/material.dart';
import 'package:integrador/src/models/inversionista_model.dart';
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


        if(snapshot.error== 401){
          return Center(
            child: Container(
              child: InkWell(
                child: Center(
                  child: Text('PRECAUCION', style: TextStyle(color: Colors.red, fontSize: 40.0),),
                ),
                onTap:()=> alertaToken(context),
              )
            ),
          );

        }

        if (!snapshot.hasData ) {
          return Center(child: CircularProgressIndicator());
        }

        final inversionistas = snapshot.data;

        if (inversionistas.length == 0) { //inversionistas.length == 0
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

  void alertaToken(BuildContext context){
     
     showDialog(
       context: context,
       barrierDismissible: true,
       builder: (context){
         return AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
           title: Text('Titulo'),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text('Su cesion ha expirado'),
               //FlutterLogo(size: 100.0,)
             ],
           ),
           actions: <Widget>[
             FlatButton(
               child: Text('Ok'),
               onPressed: ()=> Navigator.pushReplacementNamed(context, '/'),
             ),
  
           ],
          
         );
       }
     );
  }
  
}
