//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/drawerMenu_pages/faq/faq_body.dart';
//--------------------------------------------------------------------------------------------------------------------


class FaqPage extends StatefulWidget{

  static final String routeName = 'faq';
  const FaqPage({ Key key,}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: BodyFaqPage(),
    );
  }
}