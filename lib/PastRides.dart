import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PastRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Rides', style: TextStyle(
            fontSize: 25,
            fontFamily: 'Century',
            fontWeight: FontWeight.w300,
            color: Colors.white),),
        backgroundColor: Color.fromRGBO(244, 93, 2, 1),
      ),
    );
  }
}
