//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class ChatPage extends StatelessWidget {
  const ChatPage({ Key key,}) : super(key: key);
  static final String routeName = 'chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Chat Page'),
      ),
      drawer: MenuWidget(),
    );
  }
}