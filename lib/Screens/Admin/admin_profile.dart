import 'package:blood_bank/Screens/Admin/viewRecord.dart';
import 'package:blood_bank/Screens/User/selection_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'AddRecord.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Profile',
      home:  adminpProfile(),
    );
  }
}

class adminpProfile extends StatelessWidget {
   adminpProfile({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        title: Text("Admin Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                // child: Image(image: AssetImage("images/launch.png"),)
              ),
            ),
            ListTile(
              leading: const Icon(MdiIcons.faceManProfile),
              title: const Text('User_Side',
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
                //  FirebaseAuth.instance.signOut();
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
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

      body:   SafeArea(
        child: Column(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewRecord(),));
                          },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                              // color: Colors.red,
                              height: 95,
                              width: 80,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white
                              ),
                              child:  Column(
                                children: [
                                  Text('View Record',textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),),
                                  SizedBox(height: 7,),
                                  Icon(MdiIcons.eye,color: Colors.red,size: 22,)
                                ],

                              ),
                            ),),
                          const SizedBox(width: 20,),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddRecord(),));
                          },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                              // color: Colors.red,
                              height: 95,
                              width: 80,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white
                              ),
                              child:  Column(
                                children: [
                                  Text('Add Record',textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),),
                                  SizedBox(height: 7,),
                                  Icon(MdiIcons.upload,color: Colors.red,size: 24,)
                                ],

                              ),
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
