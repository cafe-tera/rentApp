//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:rent_app/src/pages/Perfil_pages/user_perfil_page.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/providers/contactos_provider.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------


class ContactosPage extends StatefulWidget {
  const ContactosPage({ Key key,}) : super(key: key);
  static final String routeName = 'contactos';

  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Contactos Page'),
      ),
      drawer: MenuWidget(),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: contactosProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaContactos(snapshot.data, context),
          ),
        );
      },
    );
  }

  List<Widget> _listaContactos(List data, BuildContext context) {
    final List<Widget> contactos = [];

    data.forEach((contacto) {
      final widgetTemp = Container(
        height: 75.0,
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),

            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: _imagenContacto(contacto),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 30,
                  child: _contenidoContacto(contacto),
                ),
              ],
            )),
      );

      contactos..add(widgetTemp);
    });

    contactos..add(Divider());
    
    return contactos;
  }

  Widget _imagenContacto(item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(
            item['Imagen'],
          ),
          placeholder: AssetImage('assets/Alternate-Preloader.gif',),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  Widget _contenidoContacto(item) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          _encabezado(item),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _perfilboton(),
              _mensajeBoton(),
            ],
          ),

        ],
      ),
    );
  }

  Widget _encabezado(item) {
    double ratingBarSize = 12.0;
    int starCount = 5;
    double rating  = item['Puntos'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        Text(
          item['Nombres']+' '+item['Apellidos'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        _rattingBar(ratingBarSize, rating, starCount),

      ],
    );
  }

  Widget _rattingBar(double ratingBarSize, double rating, int starCount) {

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: StarRating(
              size: ratingBarSize,
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
          
        ],
      ),
    );

  }

  Widget _perfilboton() {
    return Container(
      height: 23,
      width: 75,
      child: RaisedButton(
        color: Color(colors.azulGeneral),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Icon(Icons.person_pin, size: 10,color: Color(colors.fondoBlanco),),
            Text('Perfil', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 8),),

          ],
        ),
        onPressed: (){
          Navigator.of(context).pushNamed(PerfilPage.routeName);
        },
      ),
    );
  }

  Widget _mensajeBoton() {
    return Container(
      height: 23,
      width: 75,
      child: RaisedButton(
            
        color: Color(colors.azulGeneral),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Icon(Icons.message, size: 10,color: Color(colors.fondoBlanco),),
            Text('Mensaje', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 8),),

          ],
        ),
        onPressed: (){},
      ),
    );
  }
}