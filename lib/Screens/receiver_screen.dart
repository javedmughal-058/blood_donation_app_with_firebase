import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'List_of_Donor.dart';
import 'selection_screen.dart';
import 'login.dart';

class receiver_screen extends StatelessWidget {
  const receiver_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(title: const Text('Pak Blood Donation'),backgroundColor: Colors.redAccent,),
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
                  }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.redAccent,)),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
                                    MaterialPageRoute(builder: (context) => const donorsList()));
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
