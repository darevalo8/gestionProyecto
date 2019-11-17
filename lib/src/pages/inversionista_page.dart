import 'package:flutter/material.dart';
import 'package:integrador/src/models/cliente_model.dart';
import 'package:integrador/src/models/inversionista_model.dart';
import 'package:integrador/src/providers/users_provider.dart';

class InversionistaPage extends StatelessWidget {
  final userProvider = UserProvider();
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
        body: _getInver(data));
  }

  Widget _getInver(Map<String, dynamic> data) {
    return FutureBuilder(
      future: userProvider.getInversionistas(data),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<Inversionista>> snapshot) {


        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator() );
        }

        final inversionistas = snapshot.data;

        if (inversionistas.length == 0){
          return Center(
            child: Text('No hay inversionistas'),
          );
        }

        return ListView.builder(
          itemCount: inversionistas.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red,),
            child: ListTile(
              dense: false,
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor,),
              title: Text(inversionistas[i].nombreInversionista),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            ),
          )
          
          
        );

        
      },
    );
  }

  List<Widget> _listInversionistas(List<Inversionista> data, BuildContext context) {
    final List<Widget> items = [];
    data.forEach((value) {
      final wigetTempo = Card(
        child: ListTile(
          title: Text(value.nombreInversionista),
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
