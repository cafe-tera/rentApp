//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/notificaciones_bloc/notificaciones_bloc.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/notificaciones/notificaciones_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class NotificacionesPage extends StatelessWidget{

  static final String routeName = 'notificaciones';
  final NotificacionesBloc faqBloc = NotificacionesBloc();
  
  @override
  Widget build(BuildContext context){
    return BlocProvider<NotificacionesBloc>(
      bloc: faqBloc,
      child: BodyNotificacionesPage(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }

}