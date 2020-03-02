//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

// local imports
//import 'package:rent_app/src/models/notificaciones_model.dart';
import 'package:rent_app/src/utils/bloc_util.dart' as utils; 
//--------------------------------------------------------------------------------------------------------------------
class TiendaBloc{

  BehaviorSubject<utils.TabState> _viewStateCtrl = 
    BehaviorSubject<utils.TabState>.seeded(utils.TabState.Loading);

  Map<String, dynamic> TiendaMap;

  List<Tienda> notificaciones = List();

  Stream<Map<String, dynamic>> get stream =>
    _viewStateCtrl.stream.transform(StreamTransformer.fromHandlers(
      handleData: (utils.TabState currentState, sink){
        switch(currentState){

          case utils.TabState.Showing:
            sink.add(notificacionesMap);
            break;
          
          case utils.TabState.NoNet:
            sink.add(notificacionesMap);
            break;
          
          case utils.TabState.Error:
            sink.add(notificacionesMap);
            break;

          case utils.TabState.Loading:
            sink.add(null);
            break;
        }
      }
    )
  );

  void cargarNotificacion() async{

    final resp = await rootBundle.loadString('data/notificaciones.json');
    notificacionesMap = json.decode(resp);

    if (await utils.internetDisabled()){
      notificacionesMap = {'status': 0, 'encuestas': List()};
      _viewStateCtrl.sink.add(utils.TabState.NoNet);
      return;
    }

    if(notificacionesMap['status'] != 200){
      _viewStateCtrl.sink.add(utils.TabState.Error);
      return;
    }

    if(notificaciones.isEmpty){
      for(var item in notificacionesMap['notificaciones']){
        Notificacion notificacion = Notificacion.fromJson(item);
        notificaciones.add(notificacion);
      }
      _viewStateCtrl.sink.add(utils.TabState.Showing);
    } else {
      _viewStateCtrl.sink.add(utils.TabState.Showing);
    }
  }

  dispose(){
    _viewStateCtrl.close();
  }

}