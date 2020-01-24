//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/providers/faq_provider.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class FaqPage extends StatefulWidget{
  const FaqPage({ Key key, }) : super(key: key);
  static final String routeName = 'faq';

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('FAQ'),
      ),
    );
  }
}
