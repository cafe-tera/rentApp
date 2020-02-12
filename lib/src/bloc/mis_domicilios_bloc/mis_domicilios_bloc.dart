//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart';

// local imports
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class MisDomiciliosBloc {

  List<Domicilio> domicilios = List();

  void cargarMisDomicilios() async {
    
    final resp = await rootBundle.loadString('data/domicilios.json');
    Map dataMap = json.decode( resp );

    for (var item in dataMap['domicilios']) {
        Domicilio domicilio = Domicilio.fromJson(item);
        domicilios.add(domicilio);
    }

  }

  dispose(){}

}