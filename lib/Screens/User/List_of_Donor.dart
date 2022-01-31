import 'package:blood_bank/Screens/Admin/login.dart';
import 'package:blood_bank/Screens/User/receiver_screen.dart';
import 'package:blood_bank/Screens/User/selection_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class donorsList extends StatefulWidget {
  String str;
  donorsList(this.str,{Key? key}) : super(key: key);

  @override
  State<donorsList> createState() => _donorsListState(this.str);
}

class _donorsListState extends State<donorsList> {
  _donorsListState(this.bloodGroup);
  @override
  late String bloodGroup;
  var values=[];
  var keys=[];
  void counter()async{
   values=[];
   keys=[];
    var contact = [];
    final ref = FirebaseDatabase.instance.reference();
    late DataSnapshot ds;
    ds = await ref.child("User").once().then((value) => value.snapshot);
   // print("abc");
    if (ds.exists && ds.value != null)
    {
      Map map=ds.value as Map;
      map.forEach((key, value) {
        if(value['bloodGroup']==bloodGroup){
         keys.add(key);
         values.add(value);
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
  Widget build(BuildContext context) {
    if(first){
      counter();
    }

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(MdiIcons.arrowLeft),
              onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context)=> receiver_screen())); },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text("List of Donor"),
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
              child: ListView.builder(shrinkWrap: true,itemCount: keys.length,itemBuilder: (_,index){

                return  Container(
                  margin: EdgeInsets.only(top: 10),
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
                          children:  [
                            SizedBox(height: 20,),
                            Text("${values[index]['name']}",style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'Shrikhand',
                            ),),
                            Text("0${values[index]['contact']}",style: TextStyle(
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
                                FlutterPhoneDirectCaller.callNumber("0${values[index]['contact']}");

                              }, icon:const Icon(MdiIcons.phone),hoverColor: Colors.green, ),
                            ],
                          ),
                        ),
                      ]
                  ),
                )
                ;
              },),

                        ),
       ),
          ),
        ]
      ),
      ),
    );
  }
}
