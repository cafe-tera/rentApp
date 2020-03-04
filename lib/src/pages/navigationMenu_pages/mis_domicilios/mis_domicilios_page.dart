//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/mis_domicilios_bloc.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios/mis_domicilios_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class MisDomiciliosPage extends StatelessWidget {

  static final String routeName = 'misDomicilios';
  final MisDomiciliosBloc misDomiciliosBloc = MisDomiciliosBloc();

  void inputData() async {
    final _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    inputData();
    return BlocProvider<MisDomiciliosBloc>(
      bloc: misDomiciliosBloc,
      child: BodyMisDomiciliosPage(),
      onDispose: (_,bloc)=>bloc.dispose(),
    );
  }
}