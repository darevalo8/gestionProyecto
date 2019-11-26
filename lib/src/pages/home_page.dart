import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final estiloTitulo    = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de proyectos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulos(),
            SizedBox(height: 280,),
            _creditos()
            
          ],
        ),
      ),
      drawer: _drawer(context),
    );
  }
  
  Widget _drawer(BuildContext context){
    var data =  ModalRoute.of(context).settings.arguments;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Gestor de proyectos', style: TextStyle(color: Colors.white, fontSize: 20.0),),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              ),
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Gestion de clientes'),
            onTap: (){
              Navigator.pushNamed(context, 'cliente', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            leading: Icon(Icons.domain),
            title: Text('Gestion de Inversionistas'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'inversionista', arguments: data);
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
          ListTile(
            leading: Icon(Icons.card_travel),
            title: Text('Proyectos'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'proyecto');
            },
          ),
          Divider(thickness: 1.0, color: Colors.black,),
        ],
      ),
    );
  }

  Widget _crearImagen(){
    return Image(

      image: NetworkImage('https://blog.teamleader.es/hs-fs/hubfs/Content%20Kit%20Campaigns/CK1%20-%20Project%20Management/Blogs/B3%20-%20Why%20project%20management%20fails%20-%207%20common%20causes/20180129_Q2_Blog1_WhyPMFails_Header.jpg?width=861&name=20180129_Q2_Blog1_WhyPMFails_Header.jpg'),

    );
  }

  Widget _crearTitulos(){

    return SafeArea(
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Herramienta para gestionar proyectos', style: estiloTitulo,),
                  SizedBox(height: 7.0,),
                  Text('Esta es la app que debes usar', style: estiloSubTitulo,)
                ],
              ),
            ),
            // Icon(Icons.star, color: Colors.red, size: 30.0,),
            // Text('41', style: TextStyle (fontSize: 20.0))
          ],
        ),
      ),
    );
  }
  Widget _creditos(){

    return Container(
      width: 500,
      height: 100,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Daniel Arevalo', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('Andres Cortes', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('Andres Gallo', style: TextStyle(color: Colors.white, fontSize: 18),),
          ],
        ),
      ),
    );

  }
}