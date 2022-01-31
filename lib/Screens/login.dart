import 'package:blood_bank/Screens/selection_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'Login-page';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
    //  initialValue: 'abc@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
        )),
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
        )
      ),

    );
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {

        },
        padding: const EdgeInsets.all(12),
        color: Colors.red,
        child: const Text('Log In', style: TextStyle(color: Colors.white,height: 2)),
      ),
    );
    final forgotLabel = FlatButton(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
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
          child: Form(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration (
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
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
                  const SizedBox(height: 12.0),
                  email,
                  const SizedBox(height: 8.0),
                  password,
                  const SizedBox(height: 10.0),
                  loginButton,
                  forgotLabel,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}