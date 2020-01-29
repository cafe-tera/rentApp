//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/providers/domicilios_favoritos_provider.dart';
import 'package:rent_app/src/utils/estados_util.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class MisDomiciliosFavoritosPage extends StatefulWidget{
  const MisDomiciliosFavoritosPage({Key key}) : super(key: key);
  static final String routename = 'misDomiciliosFavoritos';

  @override
  _MisDomiciliosFavoritosPageState createState() => _MisDomiciliosFavoritosPageState();
}

class _MisDomiciliosFavoritosPageState extends State<MisDomiciliosFavoritosPage> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mis Domicilios Favoritos'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: domiciliosFavoritosProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaDomiciliosFavoritos(snapshot.data, context),
          ),
        );
      },
    );
  }

  List<Widget> _listaDomiciliosFavoritos(List<dynamic> data, BuildContext context){
    final List<Widget> domiciliosFavoritos = [];

    data.forEach((domicilio){
      final widgetTemp = Container(
        height: 75.0,
        child: Material(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DomicilioPerfilPage(
                      domiciliosData: domicilio,
                    )
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 20,
                    child: _imagenDomicilio(domicilio),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 30,
                    child: _contenidoDomicilio(domicilio),
                  ),
                  Expanded(
                    flex: 2,
                    child: _estadoDomicilio(domicilio),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      domiciliosFavoritos..add(widgetTemp);
    });

    domiciliosFavoritos..add(Divider());
    return domiciliosFavoritos;
  }

  Widget _imagenDomicilio(item) {
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

  Widget _estadoDomicilio(item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: getEstado(item['Estado']),
      ),
    );
  }

  Widget _contenidoDomicilio(item) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  item['Tipo'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                item['Texto'],
                style: TextStyle(fontSize: 12, color: Color(colors.textoDomInfo)),
              ),
            ),
          ),
          // Expanded(
          //   flex: 3,
          //   child: Container(
          //     width: 150,
          //     child: RaisedButton(
          //       color: Color(colors.azulGeneral),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[

          //           Icon(Icons.assistant_photo, color: Color(colors.botonVer), size: 10,),
          //           Text('ver detalle', style: TextStyle(color: Color(colors.botonVer), fontSize: 10),),
          //         ],
          //       ),
          //       onPressed: (){},
          //     ),

          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Divider(),
          ),
        ],
      ),
    );
  }

}