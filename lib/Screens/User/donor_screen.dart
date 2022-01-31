import 'package:blood_bank/Screens/User/selection_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Doner extends StatefulWidget {
   Doner({Key? key}) : super(key: key);
  @override
  _DonerPageState createState() =>  _DonerPageState();
}
class _DonerPageState extends State<Doner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(MdiIcons.arrowLeft),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>screen1()));},
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text("Donor"),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Please Register Yourself ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic
                      )),
                  Register(),
                ]),
          )),
    );
  }
}

class Register extends StatefulWidget {
  //RegisterPet({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final listOfblood = ["A+", "A-", "B+","B-","AB+","AB-","O+","O-","N+","N-"];
  String dropdownValue = 'A+';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final contactController=TextEditingController();
  final addressController=TextEditingController();
  final dropdown= TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference().child("User");

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Age",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Age';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: "Contact",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Contact';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: DropdownButtonFormField(
                  value: dropdownValue,
                  icon: Icon(MdiIcons.arrowDownDropCircle),
                  decoration: InputDecoration(
                    labelText: "Select blood Type",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: listOfblood.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: ( String? newValue) {
                    dropdownValue = newValue!;
                    setState(() {
                      //dropdownValue = newValue;
                    });
                  },

                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            Map map={
                              "name": nameController.text,
                              "age": ageController.text,
                              "type": dropdownValue,
                              "contact":contactController.text,
                              "address":addressController.text,
                            };
                            dbRef.push().set(map).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Successfully Added')));
                              ageController.clear();
                              nameController.clear();
                              contactController.clear();
                              addressController.clear();
                              dropdown.clear();
                            }).catchError((onError) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(onError)));
                            });
                          }
                        },
                        child: Text('Submit'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                      ),

                    ],
                  )),

            ])));
  }

  @override
  void dispose() {
    super.dispose();
    ageController.dispose();
    nameController.dispose();
  }
}