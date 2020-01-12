//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/providers/domicilios_provider.dart';
import 'package:rent_app/src/utils/estados_util.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------

class MisDomiciliosPage extends StatelessWidget {
  const MisDomiciliosPage({Key key}) : super(key: key);
  static final String routeName = 'misDomicilios';

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
          // color: Colors.black,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaItems(snapshot.data, context),
          ),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((item) {
      final widgetTemp = Container(
        height: 75.0,
        child: Card(
            // clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: _imagenDomicilio(item),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 30,
                  child: _contenidoDomicilio(item),
                ),
                Expanded(
                  flex: 2,
                  child: _estadoDomicilio(item),
                ),
              ],
            )),
      );

      items..add(widgetTemp);
    });

    return items;
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
          placeholder: AssetImage('assets/jar-loading.gif'),
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
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Row(
                children: <Widget>[

                  FlatButton(
                    child: Text('editar...', style: TextStyle(color: Colors.indigo),),
                    onPressed: (){},
                  ),

                  FlatButton(
                    child: Text('ver...', style: TextStyle(color: Colors.indigo),),
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
