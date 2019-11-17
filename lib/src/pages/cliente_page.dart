import 'package:flutter/material.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/providers/users_provider.dart';

class ClientePage extends StatefulWidget {
  
  @override
  _ClientePageState createState() => _ClientePageState();

}

class _ClientePageState extends State<ClientePage> {
  final userProvider = UserProvider();
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
      future: userProvider.getClientes(data),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<Cliente>> snapshot) {
        
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator() );
        }

        final clientes = snapshot.data;

        if (clientes.length == 0){
          return Center(
            child: Text('No hay clientes'),
          );
        }

        return ListView.builder(
          itemCount: clientes.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red,),
            child: ListTile(
              subtitle: Text(clientes[i].telCliente),
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor,),
              title: Text(clientes[i].nombreCliente),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            ),
          )
          
          
        );
      },
    );
  }

  List<DropdownMenuItem> getOpcionesDropdown(){

    List<String> opciones = ['Ver clliente', 'Editar cliente', 'Eliminar Cliente'];
    List<DropdownMenuItem<String>> lista = List();

    opciones.forEach( (opcion) {
      print(opcion);
      lista.add(DropdownMenuItem(
        child: InkWell(
                  onTap: () {
                     setState(() {
                      _opcionSeleccionada = opcion;
                     });                   
                  },
                  child: Center(
                    child: Text(opcion,
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18,
                            letterSpacing: 1.0)),
                  ),
                ),
          value: opcion,
        )
      );
    });

    return lista;

  }

  List<Widget> _listClients(List<Cliente> data, BuildContext context) {

    
    final List<Widget> items = [];
    data.forEach((value) {
      
      final wigetTempo = Card(
        child: ListTile(
          title: Text(value.nombreCliente),
          trailing: DropdownButton(
            items: getOpcionesDropdown(),
            icon: Icon(Icons.more_vert),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
                print(_opcionSeleccionada);
              });
            },
            hint: Text(_opcionSeleccionada),
            // value: Text(_opcionSeleccionada),
          ),
          onTap: () {
            if(_opcionSeleccionada == 'Ver cliente'){

            }if(_opcionSeleccionada == 'Editar cliente'){
              
            }if(_opcionSeleccionada == 'Eliminar Cliente'){

            }
          },
        ),
      );
      items.add(wigetTempo);
    });
    return items;
  }

}
