import 'package:flutter/material.dart';

class Alerta {

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
               FlutterLogo(size: 100.0,)

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

  void mostrarAlerta(BuildContext context, String mensaje){

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('informacion incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );

}


}
