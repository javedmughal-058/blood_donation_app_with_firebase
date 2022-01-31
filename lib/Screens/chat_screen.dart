import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor-Name'),backgroundColor: Colors.red,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          //  initialValue: 'abc@gmail.com',
          decoration: InputDecoration(
              hintText: 'Type your message here..',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
              )
          )
      ),
        ]
      ),
    );
  }
}
