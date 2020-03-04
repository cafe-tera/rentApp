//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/contactos_bloc/contactos_bloc.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/contactos/contactos_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class ContactosPage extends StatelessWidget{

  static final String routeName = 'contactos';
  final ContactosBloc faqBloc = ContactosBloc();
  
  @override
  Widget build(BuildContext context){
    return BlocProvider<ContactosBloc>(
      bloc: faqBloc,
      child: BodyContactosPage(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }

}