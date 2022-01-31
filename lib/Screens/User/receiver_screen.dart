import 'package:blood_bank/Screens/Admin/login.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'List_of_Donor.dart';
import 'selection_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class receiver_screen extends StatelessWidget {
  const receiver_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
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
      title: Text("Pak Blood Donation"),
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
        body: SafeArea(child:
        Container(

            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              //borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const screen1(),
                      ),
                    );
                  }, icon: const Icon(MdiIcons.arrowLeft,color: Colors.redAccent,)),
                  const Expanded(
                    flex: 1,
                    child:
                      Text(
                        'Which blood group Do you need?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      child: ListView(
                        children: [
                          const SizedBox(height: 5,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('A-',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("A-")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('A+',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => donorsList("A+")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('B-',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("B-")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('B+',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("B+")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('AB-',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("AB-")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('AB+',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("AB+")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('O-',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("O-")));
                              },
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container (
                            decoration: BoxDecoration (
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile (
                              title: const Text('O+',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign. center,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  donorsList("O+")));
                              },
                            ),
                          ),

                        ],
                      ),
                    ),)
                ],
              ),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50),), color: Colors.white,),
            ),
        ),

        ),

    );
  }
}
