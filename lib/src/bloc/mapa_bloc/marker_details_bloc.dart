import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rent_app/src/models/domicilio_model.dart';


enum MarkerTabState {
  Showing,
  Hidding,
}

class MarkerDetailsBloc{
  Domicilio domicilio;

  BehaviorSubject<MarkerTabState> _viewStateCtrl = BehaviorSubject<MarkerTabState>.seeded(MarkerTabState.Hidding);
  Stream<Domicilio> get domicilioDetailStream =>
      _viewStateCtrl.stream.transform(StreamTransformer.fromHandlers(
          handleData: (MarkerTabState currentState, sink) {
        switch (currentState) {
          case MarkerTabState.Showing:
            sink.add(domicilio);
            break;
          case MarkerTabState.Hidding:
            sink.add(domicilio);
            break;
        }
      }));


  void showDetail(Domicilio newPlace) async {
    domicilio = newPlace;
    _viewStateCtrl.sink.add(MarkerTabState.Showing);
      return;
  }
  void hideDetail() async {
    domicilio = null;
    _viewStateCtrl.sink.add(MarkerTabState.Hidding);
    return;
  }

  dispose() {
    _viewStateCtrl.close();
  }
}