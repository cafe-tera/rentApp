//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/routes/routes.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';

import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/mis_domicilios_bloc.dart';
//--------------------------------------------------------------------------------------------------------------------

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MisDomiciliosBloc misDomiciliosBloc = MisDomiciliosBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MisDomiciliosBloc>(
        bloc: misDomiciliosBloc,
        onDispose: (BuildContext context, MisDomiciliosBloc bloc) =>
            bloc.dispose(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: LogInUpPage.routeName,
          routes: getApplicationRoutes(),
        ));
  }
}
