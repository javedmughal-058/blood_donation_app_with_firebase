import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:blood_bank/Screens/Admin/login.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../main.dart';
import 'donor_screen.dart';
import 'receiver_screen.dart';

class screen1 extends StatelessWidget {
  const screen1({Key? key}) : super(key: key);

  static const appTitle = 'Pak Blood Donation';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(MdiIcons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
             // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text("Blood Donation"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(image: AssetImage("images/launch.png"),)
              ),
            ),
            ListTile(
              leading: const Icon(MdiIcons.home),
              title: const Text('Home',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const screen1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(MdiIcons.account),
              title: const Text('Admin',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(MdiIcons.applicationSettings),
              title: const Text('Setting',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(MdiIcons.message),
              title: const Text('About us',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),
              ),
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  text: 'Pak Blood Donation \n V0.1.1 \nCopyRight \'MultiLearner\'',
                );

              },
            ),
            ListTile(
              leading: const Icon(MdiIcons.logout),
              title: const Text('Log Out',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,
                ),),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
              },
            ),
            ListTile(
              leading: const Icon(MdiIcons.information),
              title: const Text('App info',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,
                ),),
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  text: 'Pak Blood Donation \n V0.1.1 \nCopyRight \'MultiLearner\'',
                );
              },
            ),

          ],
        ),
      ),
      body:   SafeArea(child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),

          ),
          Expanded(
            flex: 9,
            child: Container(
              // width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50), ),
                  color: Colors.white,

                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                        ClipOval(
                          child: Material(
                            color: Colors.blue,
                            shadowColor: Colors.grey,// Button color
                            child: InkWell(
                              splashColor: Colors.red, // Splash color
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Doner()),
                                );
                              },
                              child:  SizedBox(width: 80, height: 80,
                                child: Image.asset('images/b-d-logo.png'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        ClipOval(
                          child: Material(
                            color: Colors.blue,
                            shadowColor: Colors.grey,// Button color
                            child: InkWell(
                              splashColor: Colors.red, // Splash color
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const receiver_screen()),
                                );
                              },
                              child:  SizedBox(width: 80, height: 80,
                                child:  Image.asset('images/reciever.png'),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Donor',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                        SizedBox(width: 50,),
                        Text('Receiver',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('images/blood-donation.png'),height: 250,width: 250,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('"Blood can circulate forever\nif you keep donating it"',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontFamily: 'Satisfy',
                          ),),
                      ],
                    ),
                  ],
                )
            ),

          ),

        ],
      ),

      ),

    );
  }
}