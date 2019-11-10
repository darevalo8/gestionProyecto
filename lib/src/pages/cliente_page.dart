import 'package:flutter/material.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/providers/users_provider.dart';

class ClientePage extends StatelessWidget {
  final userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: _getClients(data));
  }

  Widget _getClients(var data) {
    return FutureBuilder(
      future: userProvider.getClientes(data),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<Cliente>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: this._listClients(snapshot.data, context),
          );
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  List<Widget> _listClients(List<Cliente> data, BuildContext context) {
    final List<Widget> items = [];
    data.forEach((value) {
      final wigetTempo = Card(
        child: ListTile(
          title: Text(value.nombreCliente),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            print('cliente');
          },
        ),
      );
      items.add(wigetTempo);
    });
    return items;
  }
}
