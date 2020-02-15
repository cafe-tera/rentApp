import 'package:connectivity/connectivity.dart';

//Posibles estados del bloc
enum TabState {
  Showing,
  NoNet,
  Error,
  Loading,
}

// Determina si el dispositivo tiene acceso a internet
Future<bool> internetDisabled()async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  return (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi);
}