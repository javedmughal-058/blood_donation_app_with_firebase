import 'package:blood_bank/Screens/User/selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:advance_notification/advance_notification.dart';

import 'OTP.dart';
class OTPcontroller extends StatefulWidget {
  final String phone;
  final String codeDigits;
  OTPcontroller({required this.phone,required this.codeDigits});

  @override
  _OTPcontrollerState createState() => _OTPcontrollerState();
}

class _OTPcontrollerState extends State<OTPcontroller> {
  final GlobalKey<ScaffoldState> _scaffolkey= GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController= TextEditingController();
  final FocusNode _pinOTPCodeFocus= FocusNode();
  late String verificationCode;
  final BoxDecoration pinOTPCodeDecoration= BoxDecoration(
    color: Colors.redAccent,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.grey,
    )
  );
  void initState(){
    super.initState();
    veifyPhoneNumber();
  }
  veifyPhoneNumber()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential)async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((value){
          if(value.user != null){
            Navigator.of(context).push(MaterialPageRoute(builder:  (c) => screen1()));

          }
        });
      },
      verificationFailed: (FirebaseAuthException e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              duration: Duration(seconds: 3),
            )
        );
      },
      codeSent: (String vID, int? resendToken){
        setState(() {
          verificationCode = vID;
        });
    },
    codeAutoRetrievalTimeout: (String vID){
    setState(() {
    verificationCode = vID;
    });
    },
    timeout: Duration(seconds: 60),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        title: Text("OTPVerification"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(MdiIcons.arrowLeft),
              onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context)=> otpLogin())); },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  veifyPhoneNumber();
                  AdvanceSnackBar(
                    message: "Successfully Login...",
                    mode: "ADVANCE",
                    duration: Duration(seconds: 5),
                    textColor: Colors.white,
                    iconColor: Colors.white,).show(context);
                },
                child: Text("Verifying: ${widget.codeDigits}-${widget.phone}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(40.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(fontSize: 25, color: Colors.white),
              eachFieldWidth: 40,
              eachFieldHeight: 55,
              focusNode: _pinOTPCodeFocus,
              controller: _pinOTPCodeController,
              submittedFieldDecoration: pinOTPCodeDecoration,
              selectedFieldDecoration: pinOTPCodeDecoration,
              followingFieldDecoration: pinOTPCodeDecoration,
              onSubmit: (pin)async{
                try{
                  await FirebaseAuth.instance.
                  signInWithCredential(PhoneAuthProvider.
                  credential(verificationId: verificationCode, smsCode: pin)).then((value) {
                    if(value.user != null){
                      Navigator.of(context).push(MaterialPageRoute(builder:  (c) => screen1()));
                    }
                  });
                }
                catch(e){
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid OTP"),
                      duration: Duration(seconds: 3),
                    )
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}