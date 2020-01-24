//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _NotificacionesProvider{

  List<dynamic> items = [];

  _NotificacionesProvider(){
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    
    final resp = await rootBundle.loadString('data/noficiaciones.json');

    Map dataMap = json.decode( resp );
    items = dataMap['notificaciones'];

    return items;
  }
}

final notificacionesProvider = new _NotificacionesProvider();