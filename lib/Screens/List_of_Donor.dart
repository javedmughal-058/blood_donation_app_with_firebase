import 'package:blood_bank/Screens/selection_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'login.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class donorsList extends StatefulWidget {
  const donorsList({Key? key}) : super(key: key);

  @override
  State<donorsList> createState() => _donorsListState();
}

class _donorsListState extends State<donorsList> {
  final TextEditingController _numberCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "+923024716341";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: const Text('List of Donors'),backgroundColor: Colors.red,),
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
              leading: const Icon(Icons.home),
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
              leading: const Icon(Icons.account_circle_rounded),
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
              leading: const Icon(Icons.settings_applications_rounded ),
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
              leading: const Icon(Icons.article_rounded),
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
              leading: const Icon(Icons.info),
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
            child: Container(
              // width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50), ),
                  color: Colors.white,
                ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                ),
              child: ListView(
                  children: [
                    Container(
                          height: 70,
                          decoration: BoxDecoration (
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              CircleAvatar(
                                child:MaterialButton(onPressed: (
                                    ){},
                                    child: const Image(image: AssetImage("images/man.png"),height: 50,width: 50,),),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                children: const [
                                  SizedBox(height: 20,),
                                  Text('Name of Donor',style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontFamily: 'Shrikhand',
                                  ),),
                                  Text('+923001234567',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Shrikhand',
                                  ),),
                                ],
                              ),
                              const Spacer(),
                              MaterialButton(onPressed: (){},
                                child: Row(
                                  children: [
                                    IconButton(onPressed: () async {
                                        FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);

                                    }, icon:const Icon(Icons.call_rounded),hoverColor: Colors.green, ),
                                  ],
                                ),
                              ),
                                  ]
                                  ),
                                 ),
                    const SizedBox(height: 15,),
                             ]
                            ),

                        ),
       ),
          ),
        ]
      ),
      ),
    );
  }
}
