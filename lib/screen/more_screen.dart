import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Center(
        child : Column(
          children : <Widget> [
            Container(
              padding : EdgeInsets.only(top:50),
              child : CircleAvatar(
                radius : 100,
                backgroundImage : AssetImage('images/Netflix_test.png')
              ),
            ),
          ]
        ),
      ),
    );
  }
  
}

