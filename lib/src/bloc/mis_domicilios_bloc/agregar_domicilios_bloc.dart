//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';

// local imports
//--------------------------------------------------------------------------------------------------------------------


class AgregarDomiciliosBloc {

  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }

  updateText(String text) {
    (text == null || text == "")
        ? _textController.sink.addError("Invalid value entered!")
        : _textController.sink.add(text);
  }

  dispose() {
    _textController.close();
  }
}
