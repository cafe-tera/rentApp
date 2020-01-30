//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/providers/domicilios_favoritos_provider.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/widgets/imagenDomicilio_widget.dart';
import 'package:rent_app/src/widgets/estadoDomicilio_widget.dart';
import 'package:rent_app/src/widgets/contenidoDomicilioLista_widget.dart';
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
                    child: ImagenDomicilioWidget(item: domicilio),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 30,
                    child: ContenidoDomicilioListaWidget(item: domicilio),
                  ),
                  Expanded(
                    flex: 2,
                    child: EstadoDomicilioWidget(item: domicilio),
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
  
}