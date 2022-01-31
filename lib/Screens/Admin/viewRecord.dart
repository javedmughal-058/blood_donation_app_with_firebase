import 'package:blood_bank/Screens/User/List_of_Donor.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'admin_profile.dart';
import 'package:firebase_database/firebase_database.dart';

class ViewRecord extends StatefulWidget {
  const ViewRecord({Key? key}) : super(key: key);

  @override
  _ViewRecordState createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  int aPlus=0;
  int aneg=0;
  int bplus=0;
  int bneg=0;
  int abplus=0;
  int abneg=0;
  int oplus=0;
  int oneg=0;
  void counter()async{
    aPlus=0;
    var contact = [];
    final ref = FirebaseDatabase.instance.reference();
    late DataSnapshot ds;
    ds = await ref.child("User").once().then((value) => value.snapshot);

    if (ds.exists && ds.value != null)
    {
      Map map=ds.value as Map;
      map.forEach((key, value) {
        if(value['bloodGroup']=="A+"){
          aPlus++;
        }
        else if(value['bloodGroup']=="A-"){
          aneg++;
        }
        else if(value['bloodGroup']=="B+"){
          bplus++;
        }
        else if(value['bloodGroup']=="B-"){
          bneg++;
        }
        else if(value['bloodGroup']=="AB+"){
          abplus++;
        }
        else if(value['bloodGroup']=="AB-"){
          abneg++;
        }
        else if(value['bloodGroup']=="O+"){
          oplus++;
        }
        else if(value['bloodGroup']=="O-"){
          oneg++;
        }
      });
    }
if(first){
  first=false;
  setState(() {

  });
}
  }

  bool first=true;
  @override
  Widget build(BuildContext context) {
    if(first){
    counter();}
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(MdiIcons.arrowLeft),
              onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp1())); },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
               // IconButton(
                //icon: const Icon(MdiIcons.refresh),
              //  onPressed: () {
               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRecord()));
                //    }
             // )
        ],
        backgroundColor: Colors.red,title: Text('Record',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),),
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
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                              TextButton(onPressed: (){},
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/A+.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$aPlus',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                              const SizedBox(width: 20,),
                              TextButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("A-")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/A-.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$aneg',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                              TextButton(onPressed: (){
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("AB+")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/AB+.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$abplus',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                              const SizedBox(width: 20,),
                              TextButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("AB-")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/AB-.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$abneg',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                              TextButton(onPressed: (){
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("B+")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/B+.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$bplus',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                              const SizedBox(width: 20,),
                              TextButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("B-")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/B-.png'),
                                      Text('$bneg',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(image: AssetImage("images/blood-donation.png"),height: 150,width: 150,),
                              TextButton(onPressed: (){
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("O+")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/O+.png',height: 55,width: 55,),
                                      SizedBox(height: 3,),
                                      Text('$oplus',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                              const SizedBox(width: 20,),
                              TextButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  donorsList("O-")));
                              },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                                  // color: Colors.red,
                                  height: 95,
                                  width: 85,
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
                                      Image.asset('images/O-.png',),
                                      Text('$oneg',textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),),

                                    ],

                                  ),
                                ),),
                            ],
                          ),
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
