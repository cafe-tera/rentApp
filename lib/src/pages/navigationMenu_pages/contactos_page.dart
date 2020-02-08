//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/pages/Perfil_pages/user_perfil_page.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/providers/contactos_provider.dart';
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
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
      child: _encabezado(item),
    );
  }

  Widget _encabezado(item) {
    double rating  = item['Puntos'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          item['Nombres']+' '+item['Apellidos'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        
        SizedBox(height: 5,),

        RatingBarWidget(ratingValue: rating, barSize: 15.0,)

      ],
    );
  }
}