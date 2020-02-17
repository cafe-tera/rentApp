//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// local import
import 'package:rent_app/src/models/faq_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class FaqProvider{

  // Lista de faqs
  List<Faq> faqs = List();

  FaqProvider(){
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async{

    final resp = await rootBundle.loadString('data/faq.json');

    Map<String, dynamic> faqsMap;
    faqsMap = json.decode(resp);

    if(faqs.isEmpty){
      for(var item in faqsMap['faq']){
        Faq faq = Faq.fromJson(item);
        faqs.add(faq);
      }
    }

    return faqs;
  }
}

final faqProvider = new FaqProvider();