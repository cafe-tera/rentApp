//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/mis_domicilios_bloc.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios/mis_domicilios_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class MisDomiciliosPage extends StatelessWidget {

  static final String routeName = 'misDomicilios';
  final MisDomiciliosBloc misDomiciliosBloc = MisDomiciliosBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MisDomiciliosBloc>(
      bloc: misDomiciliosBloc,
      child: BodyMisDomiciliosPage(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }
}