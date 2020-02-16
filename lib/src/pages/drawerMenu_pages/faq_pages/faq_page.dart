//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/faq_bloc/faq_bloq.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/faq_pages/faq_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class FaqPage extends StatelessWidget{

  static final String routeName = 'faq';
  final FaqBloc faqBloc = FaqBloc();
  
  @override
  Widget build(BuildContext context){
    return BlocProvider<FaqBloc>(
      bloc: faqBloc,
      child: BodyFaqPage(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }

}