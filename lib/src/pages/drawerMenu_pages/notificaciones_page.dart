//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/providers/notificaciones_provider.dart';
//--------------------------------------------------------------------------------------------------------------------


class NotificacionesPage extends StatefulWidget {
  const NotificacionesPage({ Key key,}) : super(key: key);
  static final String routeName = 'notificaciones';

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Notificaciones Page'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    return FutureBuilder(
      future: notificacionesProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaNotificaciones(snapshot.data, context),
          ),
        );
      } ,
    );
  }

  List<Widget> _listaNotificaciones(List<dynamic> data, BuildContext context){
    final List<Widget> notificaciones = [];
    var size = MediaQuery.of(context).size;

    data.forEach((notificacion){
      final widgetTemp = Container(
        height: 100.0,
        child: Material(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child:  Column(
              children: <Widget>[
                Expanded(
                  flex: size.width.toInt(),
                  child: _headerNotificacion(notificacion),
                ),
                Expanded(
                  flex: size.width.toInt(),
                  child: _textoNotificacion(notificacion),
                )
              ],
            ),
          ),
        ),
      );

      notificaciones..add(widgetTemp);
    });

    return notificaciones;
  }

  Widget _headerNotificacion(item){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                item['Titulo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                item['Timestamp'],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textoNotificacion(item){
    return Container(
      child: Text(
        item['Texto'],
      ),
    );
  }
}