//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/providers/providers/domicilios_provider.dart';
//--------------------------------------------------------------------------------------------------------------------

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Home Page'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: domiciliosProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Column(
          children: <Widget>[

            SizedBox(height: 25.0,),

            Expanded(
                flex: 1,
                child: Text('Lista de Domicilios',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ),

            Expanded(
              flex: 12,
              child: Container(
                color: Colors.black26,
                child: ListView(
                  children: _listaItems( snapshot.data, context ),
                ),
              ),
            ),

            SizedBox(height: 30.0,),

          ],
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> items = [];

    // Titulo Seccion
    // items
    //   ..add(Container(
    //       padding: EdgeInsets.symmetric(vertical: 20.0),
    //       alignment: Alignment.center,
    //       child: Text('Lista de Domicilios',
    //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))));

    // Lista de Domicilios
    // La lista de domicilios es leida desde un JSON
    data.forEach((item) {
      final widgetTemp = Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: FadeInImage(
                image: NetworkImage(item['Imagen']),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
              ),
              title: Text(item['Tipo']),
              subtitle: Text(item['Texto']),
              onTap: () {},
            )
          ],
        ),
      );

      items..add(widgetTemp)..add(Divider());
    });

    return items;
  }
}
