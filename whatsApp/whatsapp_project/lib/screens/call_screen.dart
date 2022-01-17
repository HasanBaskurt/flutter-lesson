import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/models/call.dart';
import 'package:whatsapp_project/models/chat.dart';

class CallScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CallScreenState();
}

class CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Call.fakeData.length,
      itemBuilder: (context, index) => Column(
        children: [
          Divider(
            height: 10,
          ),
          ListTile(
            onTap: () {
              setState(() {
                print(Call.fakeData[index].name.toString());
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(Call.fakeData[index].avatarUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Call.fakeData[index].name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.videocam_rounded,
                  // ignore: deprecated_member_use
                  color: Theme.of(context).accentColor,
                )
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.call_made,
                      color: Colors.green,
                      size: 15,
                    ),
                    Text(Call.fakeData[index].time.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
