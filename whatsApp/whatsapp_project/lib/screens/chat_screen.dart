import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/models/chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Chat.fakeData.length,
      itemBuilder: (context, index) => Column(
        children: [
          Divider(
            height: 10,
          ),
          ListTile(
            onTap: () {
              setState(() {
                print(Chat.fakeData[index].name.toString());
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(Chat.fakeData[index].avatarUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Chat.fakeData[index].name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  Chat.fakeData[index].time.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_outlined,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(" " + Chat.fakeData[index].message.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
