import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/models/call.dart';
import 'package:whatsapp_project/models/chat.dart';
import 'package:whatsapp_project/models/state.dart';

class StateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateScreenState();
}

class StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: StateModel.fakeData.length,
      itemBuilder: (context, index) => Column(
        children: [
          Divider(
            height: 10,
          ),
          ListTile(
            onTap: () {
              setState(() {
                print(StateModel.fakeData[index].name.toString());
              });
            },
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(StateModel.fakeData[index].avatarUrl),
            ),
            title: Text(
              StateModel.fakeData[index].name.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(StateModel.fakeData[index].message.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
