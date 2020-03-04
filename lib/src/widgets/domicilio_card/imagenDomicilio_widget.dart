//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class ImagenDomicilioWidget extends StatelessWidget{

  final Domicilio item;

  ImagenDomicilioWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(
            item.imagen,
          ),
          placeholder: AssetImage('assets/Alternate-Preloader.gif',),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

}