//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/drawerMenu_pages/tienda_page.dart';
import 'package:rent_app/src/providers/domicilios_provider.dart';
import 'package:rent_app/src/utils/estados_util.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class MisDomiciliosPage extends StatefulWidget {
  const MisDomiciliosPage({Key key}) : super(key: key);
  static final String routeName = 'misDomicilios';

  @override
  _MisDomiciliosPageState createState() => _MisDomiciliosPageState();
}

class _MisDomiciliosPageState extends State<MisDomiciliosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mis Domicilios'),
      ),
      drawer: MenuWidget(),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: domiciliosProvider.cargarData(),
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
      final widgetTemp = InkWell(
      onTap: (){},
      child: Container(
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
                ),
              ],
            )),
      ));

      domicilios..add(widgetTemp);
    });

    domicilios..add(Divider());
    domicilios..add(

      Container(
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
      )
    );
    domicilios..add(Divider());
    return domicilios;
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
          Expanded(
            flex: 4,
            child: Container(
              child: Row(
                children: <Widget>[

                  FlatButton(
                    child: Text('editar...', style: TextStyle(color: Color(colors.botonEditar)),),
                    onPressed: (){},
                  ),

                  FlatButton(
                    child: Text('ver...', style: TextStyle(color: Color(colors.botonVer)),),
                    onPressed: (){},
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
