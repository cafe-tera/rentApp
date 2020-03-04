//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/agregar_domicilios_bloc.dart';
//--------------------------------------------------------------------------------------------------------------------

class AgregarDomicilioBody extends StatefulWidget {
  @override
  _AgregarDomicilioBodyState createState() => _AgregarDomicilioBodyState();
}

class _AgregarDomicilioBodyState extends State<AgregarDomicilioBody> {

  @override
  Widget build(BuildContext context) {
    
  AgregarDomiciliosBloc _bloc = Provider.of<AgregarDomiciliosBloc>(context);

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Agregar Domicilio'),
      ),
      body: _agregarDomicilio(_bloc, context),
    );
  }

  Widget _agregarDomicilio(AgregarDomiciliosBloc _bloc, BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: _bloc.textStream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                
            // Si todo sale bien, entonces retorna la lista
            return _form(_bloc, context);
          }),
    );
  }

  Widget _form(AgregarDomiciliosBloc bloc, BuildContext context) {
    return TextField(
                          onChanged: (String text) =>
                              bloc.updateText(text),
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 0.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        );
  }
}