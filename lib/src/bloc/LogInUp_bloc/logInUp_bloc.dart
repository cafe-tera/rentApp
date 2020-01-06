import 'package:rxdart/rxdart.dart';

class LogInUpBloc {
  
  final _inLogin = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get changeIsLogin => _inLogin.stream;

  bool get isLogin => _inLogin.value;

  register(){
    _inLogin.sink.add(false);
  }

  login(){
    _inLogin.sink.add(true);
  }

  dispose() {
    _inLogin?.close();
  }
}