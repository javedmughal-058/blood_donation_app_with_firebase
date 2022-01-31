import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'OTPcontrol.dart';
    class otpLogin extends StatefulWidget {
      const otpLogin({Key? key}) : super(key: key);
    
      @override
      _otpLoginState createState() => _otpLoginState();
    }
    
    class _otpLoginState extends State<otpLogin> {
  String dialCodeDigits="+00";
  TextEditingController _controller= TextEditingController();
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Image.asset("images/b-d-logo.png",height: 220,width: 220,),
            ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      "Register Phone Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  height: 60,
                  width: 400,
                  child: CountryCodePicker(
                    onChanged: (country){
                      setState(() {
                        dialCodeDigits= country.dialCode!;
                      });
                    },
                    initialSelection: "IT",
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    favorite: ["+1","US","+92","PAK"],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10 , right:10 ,left:20 ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(dialCodeDigits),
                      )
                    ),
                    maxLength: 12,
                    keyboardType:TextInputType.number ,
                    controller: _controller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=> OTPcontroller(
                        phone: _controller.text,
                        codeDigits: dialCodeDigits,
                      )));
                    },
                    child: Text('Next',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),

        );
      }
    }
    