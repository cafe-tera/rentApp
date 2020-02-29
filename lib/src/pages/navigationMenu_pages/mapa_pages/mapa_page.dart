//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/bloc/mapa_bloc/mapa_bloc.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mapa_pages/mapa_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class MapaPage extends StatelessWidget {

  static final String routeName = 'mapa';
  final MapaBloc mapaBloc = MapaBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapaBloc>(
      bloc: mapaBloc,
      child: MapaBody(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }
}