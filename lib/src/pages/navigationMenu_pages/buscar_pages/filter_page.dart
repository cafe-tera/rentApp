//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/tienda_page.dart';
import 'package:rent_app/src/providers/filter_provider.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/imagenDomicilio_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/estadoDomicilio_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/contenidoDomicilioLista_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class FilterPage extends StatefulWidget {
  const FilterPage({Key key}) : super(key: key);
  static final String routeName = 'filter_pages';

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Filtro'),
      ),
      drawer: MenuWidget(),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: filterProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaDomicilios(snapshot.data, context),
          ),
        );
      },
    );
  }

  List<Widget> _listaDomicilios(List<dynamic> data, BuildContext context) {
    final List<Widget> domicilios = [];

    data.forEach((domicilio) {
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
                  ),
                ],
              ),
            )
          ),
        ),
      );

      domicilios..add(widgetTemp);
    });

    domicilios..add(Divider());
    domicilios..add(_agregarDomBoton());
    domicilios..add(Divider());
    return domicilios;
  }

  Widget _agregarDomBoton() {
    return Container(
        height: 45,
        child: RaisedButton(
          color: Color(colors.agregarDomicilio),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Icon(Icons.add, color: Color(colors.iconBlanco), size: 22,),
              Text('Agregar Domicilio', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 16),),
              Column()

            ],
          ),
          onPressed: (){
            Navigator.pushReplacementNamed(context, TiendaPage.routeName);
          },
        ),
      );
  }
}
