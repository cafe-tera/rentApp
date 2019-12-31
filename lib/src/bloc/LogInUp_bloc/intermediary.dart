import 'package:rxdart/rxdart.dart';

class IntermediaryBloc {

  final _inLogin = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get changeIsLogin => _inLogin.stream;

  bool get isLogin => _inLogin.value;

  dispose() {
    _inLogin?.close();
  }
}