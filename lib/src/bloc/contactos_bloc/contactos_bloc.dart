//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

// local imports
import 'package:rent_app/src/models/contacto_model.dart';
import 'package:rent_app/src/utils/bloc_util.dart' as utils; 
//--------------------------------------------------------------------------------------------------------------------

class ContactosBloc{

  BehaviorSubject<utils.TabState> _viewStateCtrl = 
    BehaviorSubject<utils.TabState>.seeded(utils.TabState.Loading);

  Map<String, dynamic> contactoMap;

  List<Contacto> contactos = List();

  Stream<Map<String, dynamic>> get stream =>
    _viewStateCtrl.stream.transform(StreamTransformer.fromHandlers(
      handleData: (utils.TabState currentState, sink){
        switch(currentState){

          case utils.TabState.Showing:
            sink.add(contactoMap);
            break;
          
          case utils.TabState.NoNet:
            sink.add(contactoMap);
            break;
          
          case utils.TabState.Error:
            sink.add(contactoMap);
            break;

          case utils.TabState.Loading:
            sink.add(null);
            break;
        }
      }
    )
  );

  void cargarFaq() async{

    final resp = await rootBundle.loadString('data/contactos.json');
    contactoMap = json.decode(resp);

    if (await utils.internetDisabled()){
      contactoMap = {'status': 0, 'encuestas': List()};
      _viewStateCtrl.sink.add(utils.TabState.NoNet);
      return;
    }

    if(contactoMap['status'] != 200){
      _viewStateCtrl.sink.add(utils.TabState.Error);
      return;
    }

    if(contactos.isEmpty){
      for(var item in contactoMap['contacto']){
        Contacto contacto = Contacto.fromJson(item);
        contactos.add(contacto);
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