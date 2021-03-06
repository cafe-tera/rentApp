//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

// local imports
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/utils/bloc_util.dart' as utils; 

import 'package:cloud_firestore/cloud_firestore.dart';
//--------------------------------------------------------------------------------------------------------------------


class MisDomiciliosBloc {

  final databaseReference = Firestore.instance;

  // un streamController utilizado para el envio de datos, errores y eventos.
  BehaviorSubject<utils.TabState> _viewStateCtrl =
      BehaviorSubject<utils.TabState>.seeded(utils.TabState.Loading);

  // Nos servirá para saber el status de la data recibida.
  // El estatus será usado para disernir en que estado debe estar el bloc
  Map<String, dynamic> domiciliosMap;

  // Esta lista soló se llena si hay status 200
  // Ambas cosas implican que el bloc debe entrar en estado Showing
  List<Domicilio> domicilios = List();

  // Manejo de los estados del BLOC, dependiendo de cual lancemos, será lo que la pagina deba mostrar
  // De esta forma seremos capaces de controlar varios de los problemas cotidianos de un usuario.
  Stream<Map<String, dynamic>> get stream =>
      _viewStateCtrl.stream.transform(StreamTransformer.fromHandlers(
          handleData: (utils.TabState currentState, sink) {
        switch (currentState) {

          // La consulta logró hacerse (sin importar si la lista es vacía):
          case utils.TabState.Showing:
            sink.add(domiciliosMap);
            break;

          // El dispositivo no tiene internet:
          case utils.TabState.NoNet:
            sink.add(domiciliosMap);
            break;

          // Hubo un error de consulta:
          case utils.TabState.Error:
            sink.add(domiciliosMap);
            break;

          // Cargando, es importante mandar un null, para que el stream cambie
          case utils.TabState.Loading:
            sink.add(null);
            break;

          // Lo mismo de arriba
          case utils.TabState.Loading:
            sink.add(null);
            break;
        }
      }));


  // Obtiene el json con la lista de domicilios y llena la Lista de domicilios (List<Domicilio> domicilios)
  void cargarMisDomicilios() async {

    final resp = await rootBundle.loadString('data/domicilios.json');
    domiciliosMap = json.decode(resp);

    // _viewStateCtrl.sink.add(utils.TabState.Loading);
    
    // checkeamos si el usuario tiene internet
    // Si no tiene internet se envia status 0 
    if (await utils.internetDisabled()) { 
      domiciliosMap = {'status': 0, 'encuestas': List()};
      _viewStateCtrl.sink.add(utils.TabState.NoNet);
      return;
    }

    // _viewStateCtrl.sink.add(utils.TabState.Loading);

    // Si hay un status diferente a 200 es porque ha habido un error de consulta
    if (domiciliosMap['status'] != 200) {
      _viewStateCtrl.sink.add(utils.TabState.Error);
      return;
    }

    // habiendo llegado a este punto, sabemos que la consulta ha salido bien
    if(domicilios.isEmpty){
      for (var item in domiciliosMap['domicilios']) {
        Domicilio domicilio = Domicilio.fromJson(item);
        domicilios.add(domicilio);
      }
      _viewStateCtrl.sink.add(utils.TabState.Showing);
    } else{
      _viewStateCtrl.sink.add(utils.TabState.Showing);
    }
  }

  // Esta funcion se ejecuta al cerrar o cambiar de pagina
  // De esta forma evitamos duplicidad (al dejar streams abiertos) de informacion y malgasto de recursos

  void getData() async {
    await databaseReference
        .collection("domicilios")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      // snapshot.documents.forEach((f) => print('${f.data}}'));

      for (var item in snapshot.documents) {

        String tipo = item.data['Tipo']!=null?item.data['Tipo'].toString():item.data['Tipo'.toLowerCase()].toString();
        String texto = item.data['Texto']!=null?item.data['Texto'].toString():item.data['Texto'.toLowerCase()].toString();
        String imagen = item.data['Imagen']!=null?item.data['Imagen'].toString():item.data['Imagen'.toLowerCase()].toString();
        String estado = item.data['Estado']!=null?item.data['Estado'].toString():item.data['Estado'.toLowerCase()].toString();

        double lat = item.data['Ubicacion']!=null?(item.data['Ubicacion']['lat'].toDouble()):item.data['Ubicacion'.toLowerCase()]['lat'].toDouble();
        double lng = item.data['Ubicacion']!=null?item.data['Ubicacion']['lng'].toDouble():item.data['Ubicacion'.toLowerCase()]['lng'].toDouble();

        double puntos = item.data['Puntos']!=null?item.data['Puntos'].toDouble():item.data['Puntos'.toLowerCase()].toDouble();
        bool favorito = item.data['Favorito']!=null?item.data['Favorito']:item.data['Favorito'.toLowerCase()];

        List<Informacion> informacion = [];


        // domicilios.add(domicilio);
        // print(item.data['Estado']!=null?item.data['Estado']:item.data['Estado'.toLowerCase()]);

        Ubicacion ubicacion = new Ubicacion(
          lat: lat,
          lng: lng
        );

        Domicilio domicilio = new Domicilio(
          tipo: tipo,
          texto: texto,
          imagen: imagen,
          estado: estado,
          puntos: puntos,
          favorito: favorito,
          ubicacion: ubicacion,
          informacion: informacion,
          fotos: [],
          comentarios:[]
        );
      domicilios.add(domicilio);
      }
      _viewStateCtrl.sink.add(utils.TabState.Showing);

  });
}
  dispose() {
    _viewStateCtrl.close();

    // domicilios = List();
  }

}
