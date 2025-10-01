import 'package:flutter/material.dart';

class NavigatorPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            width: 40,
            height: 40,
            child: Icon(Icons.arrow_back,size: 30,),
          ),
        ),
      ],
    );
  }
}
