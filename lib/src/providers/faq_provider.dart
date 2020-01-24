//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//--------------------------------------------------------------------------------------------------------------------

class _FaqProvider{

  List<dynamic> items = [];

  _FaqProvider(){
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async{

    final resp = await rootBundle.loadString('data/faq.json');

    Map dataMap = json.decode(resp);
    items = dataMap['faq'];

    return items;
  }
}

final faqProvider = new _FaqProvider();