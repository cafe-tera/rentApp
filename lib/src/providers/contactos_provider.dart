//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _ContactosProvider {
 
  List<dynamic> items = [];

  _ContactosProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('data/contactos.json');

    Map dataMap = json.decode( resp );
    items = dataMap['contactos'];

    return items;

  }
   
}


final contactosProvider = new _ContactosProvider();