import 'package:flutter/material.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/providers/cliente_provider.dart';

class ClientePage extends StatefulWidget {
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final clienteProvider = ClienteProvider();
  String _opcionSeleccionada = 'Ver cliente';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'add-cliente', arguments: data);
          },
        ),
        body: _getClients(data));
  }

  Widget _getClients(var data) {
    return FutureBuilder(
      future: clienteProvider.getClientes(data),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<Cliente>> snapshot) {



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

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final clientes = snapshot.data;

        if (clientes.length == 0) {
          return Center(
            child: Text('No hay clientes'),
          );
        }

        return ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (context, i) => Dismissible(
                onDismissed: (value){
                  clienteProvider.deleteClient(clientes[i]);
                } ,
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        subtitle: Text(clientes[i].telCliente),
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(clientes[i].nombreCliente),
                        onTap: () {

                        },
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Ver cliente"),
                            onPressed: (){
                              Navigator.pushNamed(context, 'verCliente', arguments: clientes[i]);
                            },
                            textColor: Colors.blue,
                          ),
                          FlatButton(
                            child: Text("Editar cliente"),
                            onPressed: (){
                              Navigator.pushNamed(context, 'editarCliente', arguments: clientes[i]);
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
               onPressed: ()=> Navigator.pushNamed(context, '/'),
             ),
  
           ],
          
         );
       }
     );
  }
}
