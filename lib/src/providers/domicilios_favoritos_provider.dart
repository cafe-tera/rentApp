//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _DomiciliosFavoritosProvider{

  List<dynamic> items = [];

  _DomiciliosFavoritosProvider(){
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async{

    final resp = await rootBundle.loadString('data/domicilios_favoritos.json');

    Map dataMap = json.decode( resp );
    items = dataMap['domicilios favoritos'];

    return items;

  }

}

final domiciliosFavoritosProvider = new _DomiciliosFavoritosProvider();