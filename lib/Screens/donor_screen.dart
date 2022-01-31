import 'package:blood_bank/Screens/selection_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class Doner extends StatefulWidget {
  static String tag = 'Doner-page';
  static String holder='';
   Doner({Key? key}) : super(key: key);
  @override
  _DonerPageState createState() =>  _DonerPageState();
}

class _DonerPageState extends State<Doner> {
  String blood = 'A+';
  var bloodgroup = Doner.holder;
  void convertion(String bloodgroup) {

    if (bloodgroup == 'A+') {
      blood = 'A+';
    }
    if (bloodgroup == 'A-') {
      blood = 'A-';
    }
    if (bloodgroup == 'B+') {
      blood = 'B+';
    }
    if (bloodgroup == 'B-') {
      blood = 'B-';
    }
    if (bloodgroup == 'AB+') {
      blood = 'AB+';
    } if (bloodgroup == 'AB-') {
      blood = 'AB-';
    }
    if (bloodgroup == 'O+') {
      blood = 'O+';
    }
    if (bloodgroup == 'O-') {
      blood = 'O-';
    }



  }


  List<String> data = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];




  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/b-d-logo.png'),
      ),
    );
    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'abc@gmail.com',
      decoration: const InputDecoration(
        hintText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
    final address = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(

        hintText: 'Address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),

    );
    final contact = TextFormField(
      // autofocus: false,
      //obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Conatct',
        contentPadding:  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
    final group = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'blood group',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),

    );
    final SigupButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: 'Submission Completed successfully!',
            autoCloseDuration: const Duration(seconds: 3),
          );

        },
        padding: const EdgeInsets.all(12),
        color: Colors.red,
        child: const Text('Submit', style: TextStyle(color: Colors.white,height: 2)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        decoration: const BoxDecoration(
          color: Colors.red,
          //borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50),), color: Colors.white,),
            child: ListView(
              shrinkWrap: true,
              //padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const screen1(),
                    ),
                  );
                }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.red,)),
                logo,
                const SizedBox(height: 5.0),
                name,
                const SizedBox(height: 5.0),
                address,
                const SizedBox(height: 5.0),
                contact,
                const SizedBox(height: 5.0),
                group,
                const SizedBox(height: 5.0),
                SigupButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}