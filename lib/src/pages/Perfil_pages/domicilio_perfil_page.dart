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
              _encabezado(size, widget.domiciliosData)
            ],
          ),
          
        ),
      )
    );
  }

  Widget _encabezado(var size, data){
    return Container(
      child: Row(
        children: <Widget>[
          _imagenDomicilio(data),
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
              //_typeBar(),
              SizedBox(height: 20,),
              _rattingBar()
          ],)
        ],
      ),
    );
  }

  Widget _imagenDomicilio(domImage) {
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
              domImage['Imagen']
            ),
          placeholder: AssetImage('assets/Alternate-Preloader.gif',),
          fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }

  Widget _rattingBar() {
    double rating = 3.5;
    int starCount = 5;
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: StarRating(
              size: 25.0,
              rating: rating,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  rating = rating;
                },
              ),
            ),
          ),
          Center(
            child: Text(
              "Your rating is: $rating",
              style: new TextStyle(fontSize: 10.0),
            ),
          ),
        ],
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