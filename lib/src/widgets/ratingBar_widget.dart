//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class RatingBarWidget extends StatelessWidget{

  final int starCount = 5;
  final double ratingValue;

  RatingBarWidget({
    Key key,
    @required this.ratingValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: StarRating(
              size: 25.0,
              rating: ratingValue,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
            ),
          ),
          Center(
            child: Text(
              "Your rating is: $ratingValue",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

}