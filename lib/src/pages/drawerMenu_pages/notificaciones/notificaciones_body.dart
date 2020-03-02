//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/bloc/notificaciones_bloc/notificaciones_bloc.dart';
import 'package:rent_app/src/bloc/provider.dart';

// local imports
import 'package:rent_app/src/models/notificaciones_model.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class BodyNotificacionesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    NotificacionesBloc _bloc = Provider.of<NotificacionesBloc>(context);
    _bloc.cargarNotificacion();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Notificaciones'),
      ),
      body: Container(
        color: Color(colors.azulGeneral),
        child: Center(
          child: Text(
            'Esta vista aun no ha sido implementada :C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _disernir(NotificacionesBloc _bloc, BuildContext context){
    return Container(
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
          return _lista(_bloc.notificaciones, context);
        },
      ),
    );
  }

  Widget _lista(List<Notificacion> notificaciones, BuildContext context){
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: _listaNotificaciones(notificaciones, context),
      ),
    );
  }

  List<Widget> _listaNotificaciones(List<Notificacion> data, BuildContext context){
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
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                item.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right:10.0, top: 10.0),
              alignment: Alignment.topRight,
              child: Text(
                item.timestamp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textoNotificacion(item){
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: 
        Text(
          item.texto,
        ),
    );
  }

}