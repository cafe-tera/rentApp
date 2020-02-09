//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class DomicilioPerfilPage extends StatefulWidget {
  static final String routeName = 'perfildomicilio';

  final domiciliosData;
  
  DomicilioPerfilPage({
    Key key,
    this.domiciliosData
  }) : super(key: key); //To receive data from parent page

  @override
  _DomicilioPerfilPageState createState() => _DomicilioPerfilPageState();
}

class _DomicilioPerfilPageState extends State<DomicilioPerfilPage>{
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Domicilio'),
        backgroundColor: Color(colors.azulGeneral),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState((){
                _favoriteStateChange(widget.domiciliosData['Favorito']);
              });
            },
            icon: Icon( (widget.domiciliosData['Favorito'])? Icons.favorite : Icons.favorite_border ),//_favoritedIconDefault
          )
        ],
      ),  

      body: _contenido(size, widget.domiciliosData)
    );
  }

  Widget _contenido(Size size, item){
    return Container(
      height: size.height,
      color:  Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _encabezado(size, item),
            Divider(),
            _cuerpo(size, item),
            Divider(),
            _comentarios(size)
          ],
        ),
        
      ),
    );
  }

  Widget _encabezado(Size size, item){
    double rating = item['Puntos'];
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[

        //portada, con una ubicacion aproximada del domicilio
        _region(size, item),

        Column(
          children: <Widget>[
            
            SizedBox(height: 100,),

            // imagen + puntuacion del perfil
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                _imagenDomicilio(item),
                Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    RatingBarWidget(ratingValue: rating, barSize: 15.0,),
                  ],
                ),
                    
              ],
            ),

            // icons buttons
            _acciones(size, item)
          ],
        ),


      ]
    );
  }

  Widget _region(Size size, item) {
    return Container(
      height: 165,
      // color: Colors.red,
      child: Image.asset(
        'assets/profile/ubicacion.PNG',
      ),
    );
  }

  Widget _acciones(Size size, item) {
    return Row(
      children: <Widget>[

        RawMaterialButton(
          onPressed: (){},
          child: Icon(Icons.map, color: Colors.white,),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),

        RawMaterialButton(
          onPressed: (){},
          child: Icon(Icons.person_pin, color: Colors.white,),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),

      ],
    );
  }

  Widget _imagenDomicilio(domData) {
    return Column(
      children: <Widget>[

        // imagen
        Container(
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
        ),

        //tipo domicilio
        Text(
          domData['Tipo'],
          style: TextStyle(fontSize: 14),
        ),

      ],
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
          width: size.width * 0.075,
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
  );
    
  _favoriteStateChange(_liked){
    if(_liked){
      _favoritedIconDefault = new Icon(
        Icons.favorite_border,
        color: Colors.white,
      );
      _liked = false;
    }
    else{
      _favoritedIconDefault = new Icon(
        Icons.favorite,
        color: Colors.white,
      );
      _liked = true;
    }
  }


}