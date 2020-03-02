//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/navigationMenu_pages/home_page/home_page.dart';
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class PerfilPage extends StatefulWidget {
  static final String routeName = 'perfil';

  final perfilData;

  const PerfilPage({
    Key key,
    this.perfilData,
  }) : super(key: key);
  

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Page'),
        backgroundColor: Color(colors.azulGeneral),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _encabezado(size),
              SizedBox(height: 20,), //imagen de perfil, ratingbar, botones
              _comentarios(size),
              SizedBox(height: 20,),
              _domicilios(size),
            ],
          ),
        ),
      )
    );
  }

  Widget _encabezado(var size) {
    return Container(
      child: Row(
        children: <Widget>[
          _imagenPerfil(widget.perfilData),
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
              RatingBarWidget(ratingValue: widget.perfilData['Puntos'], barSize: 25.0,),
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

  Widget _imagenPerfil(perfilData) {
    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Color(colors.azulGeneral),
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.all(0.1),
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.all(2.5),
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FadeInImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage(
              perfilData['Imagen']),
            placeholder: AssetImage(
              'assets/Alternate-Preloader.gif',
            ),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
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
              Navigator.pushReplacementNamed(context, HomePage.routeName);
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
