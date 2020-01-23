//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

bool _liked = false;

class DomicilioPerfilPage extends StatefulWidget {
  const DomicilioPerfilPage({ Key key,}) : super(key: key);
  static final String routeName = 'perfildomicilio';

  @override
  _DomicilioPerfilPageState createState() => _DomicilioPerfilPageState();
}

class _DomicilioPerfilPageState extends State<DomicilioPerfilPage>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Domicilio'),
        backgroundColor: Color(colors.azulGeneral),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState((){
                _favoriteStateChange(_liked);
              });
            },
            icon: _favoritedIconDefault
          )
        ],
      ),  
      body: Container(
        height: size.height,
        color:  Colors.white,
        child: SingleChildScrollView(
          
        ),
      )
    );
  }

  Icon _favoritedIconDefault = new Icon(
    Icons.favorite_border,
    color: Colors.white,
    semanticLabel: 'Añadir a favoritos'
  );
    
  _favoriteStateChange(_liked){
    if(_liked){
      _favoritedIconDefault = new Icon(
        Icons.favorite_border,
        color: Colors.white,
        //semanticLabel: 'Añadir a favoritos'
      );
      _liked = false;
    }
    else{
      _favoritedIconDefault = new Icon(
        Icons.favorite,
        color: Colors.white,
        //semanticLabel: 'Añadir a favoritos'
      );
      _liked = true;
    }
  }
}