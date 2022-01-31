import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class firebasedata extends StatefulWidget {

   firebasedata( {Key? key}) : super(key: key);

  @override
  _firebasedataState createState() => _firebasedataState();
}

class _firebasedataState extends State<firebasedata> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Records'),),
      body:Column(
          children: [
              Text("",style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontFamily: 'Shrikhand',
              ),),
           Text("",style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Shrikhand',
            ),),
          ],

      )
    );
      }
  }
