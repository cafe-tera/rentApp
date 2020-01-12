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
  const MisDomiciliosPage({ Key key}) : super(key: key);
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
          color: Colors.black,
          child: ListView(
            children: _listaItems( snapshot.data, context ),
          ),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((item) {
      final widgetTemp = Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: ListTile(
          leading: FadeInImage(
            image: NetworkImage(item['Imagen']),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
          trailing: _estado(item),
          title: Text(item['Tipo']),
          subtitle: Text(item['Texto']),
          onTap: () {},
        )  
      );

      items..add(widgetTemp);
    });

    return items;
  }

  Icon _estado(item) {
    return Icon(Icons.assistant_photo, color: getEstado(item['Estado']));
  }


}
