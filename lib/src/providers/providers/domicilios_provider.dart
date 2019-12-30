//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _DomiciliosProvider {
 
  List<dynamic> items = [];

  _DomiciliosProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('data/domicilios.json');

    Map dataMap = json.decode( resp );
    items = dataMap['domicilios'];

    return items;

  }
   
}


final domiciliosProvider = new _DomiciliosProvider();