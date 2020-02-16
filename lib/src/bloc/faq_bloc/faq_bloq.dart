//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

// local imports
import 'package:rent_app/src/models/faq_model.dart';
import 'package:rent_app/src/utils/bloc_util.dart' as utils; 
//--------------------------------------------------------------------------------------------------------------------

class FaqBloc{

  BehaviorSubject<utils.TabState> _viewStateCtrl = 
    BehaviorSubject<utils.TabState>.seeded(utils.TabState.Loading);

  Map<String, dynamic> faqMap;

  List<Faq> faqs = List();

  Stream<Map<String, dynamic>> get stream =>
    _viewStateCtrl.stream.transform(StreamTransformer.fromHandlers(
      handleData: (utils.TabState currentState, sink){
        switch(currentState){

          case utils.TabState.Showing:
            sink.add(faqMap);
            break;
          
          case utils.TabState.NoNet:
            sink.add(faqMap);
            break;
          
          case utils.TabState.Error:
            sink.add(faqMap);
            break;

          case utils.TabState.Loading:
            sink.add(null);
            break;
        }
      }
    )
  );

  void cargarFaq() async{

    final resp = await rootBundle.loadString('data/faq.json');
    faqMap = json.decode(resp);

    if (await utils.internetDisabled()){
      faqMap = {'status': 0, 'encuestas': List()};
      _viewStateCtrl.sink.add(utils.TabState.NoNet);
      return;
    }

    if(faqMap['status'] != 200){
      _viewStateCtrl.sink.add(utils.TabState.Error);
      return;
    }

    if(faqs.isEmpty){
      for(var item in faqMap['faq']){
        Faq faq = Faq.fromJson(item);
        faqs.add(faq);
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