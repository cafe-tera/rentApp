//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

// local imports
import 'package:rent_app/src/pages/navigationMenu_pages/home_page.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class MiPerfilPage extends StatefulWidget {
  const MiPerfilPage({
    Key key,
  }) : super(key: key);
  static final String routeName = 'mi_perfil';

  @override
  _MiPerfilPageState createState() => _MiPerfilPageState();
}

class _MiPerfilPageState extends State<MiPerfilPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Mi Perfil Page'),
          backgroundColor: Color(colors.azulGeneral),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            )
          ],
        ),
    );
  }


  Widget _encabezado(var size) {
    return Container(
      child: Row(
        children: <Widget>[
          _imagenPerfil(),
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
              _rattingBar(),
              SizedBox(height: 20,),
              _actionButtoms(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _comentarios(var size) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[

          _cajaComentarios(size),
          _botomAgregarComentario(size),

        ],
      ),
    );
  }

  Widget _imagenPerfil() {
    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Color(colors.azulGeneral),
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.all(0.1),
      child: Container(
        padding: EdgeInsets.all(2.5),
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FadeInImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage(
                'https://pbs.twimg.com/profile_images/626103802559492096/3r9JXu4X_400x400.jpg'),
            placeholder: AssetImage(
              'assets/Alternate-Preloader.gif',
            ),
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

  Widget _actionButtoms() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 85,
          height: 30,
          child: RaisedButton(
            color: Color(colors.azulGeneral),
            child: Center(
                child: Text(
              'Historial',
              style: TextStyle(color: Colors.white, fontSize: 11),
            )),
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 85,
          height: 30,
          child: RaisedButton(
            color: Color(colors.azulGeneral),
            child: Text(
              'Mensaje',
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            onPressed: () {
            },
          ),
        ),
      ],
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

  Widget _botomAgregarComentario(var size) {
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

  Widget _domicilios(size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
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

          Text('Domicilios?!')

          ],
        )

      ),
    );
  }

}
