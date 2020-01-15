//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class AppbarWidget extends StatelessWidget with PreferredSizeWidget{

  final Widget title;
  final List<Widget> actions;

  AppbarWidget({
    Key key,
    @required this.title,
    this.actions,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
        centerTitle: true,
        // actions: actions,
        // elevation: 0.0,
        backgroundColor: Color(colors.azulGeneral),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}