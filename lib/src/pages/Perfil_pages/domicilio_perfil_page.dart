//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

// local imports
//import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

bool _liked = false;

class DomicilioPerfilPage extends StatefulWidget {
  //const DomicilioPerfilPage({ Key key,}) : super(key: key);
  static final String routeName = 'perfildomicilio';

  final domiciliosData;
  
  DomicilioPerfilPage({this.domiciliosData});

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
          child: Column(
            children: <Widget>[
              _encabezado(size, widget.domiciliosData),
              SizedBox(height: 20,),
              _cuerpo(size, widget.domiciliosData),
              SizedBox(height: 20,),
              _comentarios(size)
            ],
          ),
          
        ),
      )
    );
  }

  Widget _encabezado(var size, domData){
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 20,),
          _imagenDomicilio(domData),
          SizedBox(width: 40,),
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text(
                domData['Tipo'],
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20,),
              _rattingBar(),
              SizedBox(height: 20,),
          ],)
        ],
      ),
    );
  }

  Widget _imagenDomicilio(domData) {
    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Color(colors.azulGeneral),
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding:  EdgeInsets.all(0.1),
      child: Container(
        padding: EdgeInsets.all(2.5),
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FadeInImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage(
              domData['Imagen']
            ),
            placeholder: AssetImage('assets/Alternate-Preloader.gif',),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }

  Widget _rattingBar() {
    final int starCount = 5;
    double ratting = 3.5;
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: StarRating(
              size: 25.0,
              rating: ratting,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (ratting) => setState(
                () {
                  ratting = ratting;
                },
              ),
            ),
          ),
          Center(
            child: Text(
              "Your rating is: $ratting",
              style: new TextStyle(fontSize: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cuerpo(var size, domData){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _informacion(size, domData),
          SizedBox(height: 20,),
          _btnAlbumMapa(size, domData),
          SizedBox(height: 20,),
        ],
      )
    );
  }

  Widget _informacion(var size, domData){
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 2.5)
        ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(domData['Texto'])
          ],
        ),
      ),
    );
  }

  Widget _btnAlbumMapa(var size, domData){
    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width * 0.05,
        ),
        Container(
          width: size.width * 0.4,
          height: 30,
          child: RaisedButton(
            color: Color(colors.azulGeneral),
            child: Text(
              'Album',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 11
              )
            ),
            onPressed: (){},
          ),
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Container(
          width: size.width * 0.4,
          height: 30,
          child: RaisedButton(
            color: Color(colors.azulGeneral),
            child: Text(
              'Ver en Mapa',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 11
              )
            ),
            onPressed: (){},
          ),
        )
      ],
    );
  }

  Widget _comentarios(var size) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[

          _cajaComentarios(size),
          _btnAgregarComentario(size),

        ],
      ),
    );
  }

  Widget _cajaComentarios(var size) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                spreadRadius: 2.5,
              )
        ]
      
      ),
      child: SingleChildScrollView(
        child:Column(
          children: <Widget>[

          Text('Soy un comentario mal hecho')

          ],
        )

      ),
    );
  }

  Widget _btnAgregarComentario(var size) {
    return Container(
      width: size.width * 0.9,
      child: RaisedButton(
        color: Color(colors.azulGeneral),
        child: Text(
                'Agregar Comentario',
                style: TextStyle(color: Colors.white, fontSize: 11),
        ),
        onPressed: (){},
      ),
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