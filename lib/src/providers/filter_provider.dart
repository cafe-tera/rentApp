//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _FilterProvider{

  List<dynamic> items = [];

  _FilterProvider(){
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    
    final resp = await rootBundle.loadString('data/filter.json');

    Map dataMap = json.decode( resp );
    items = dataMap['filtros'];

    return items;
  }
}

final filterProvider = new _FilterProvider();