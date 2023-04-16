import 'dart:async';

import 'package:answer24/models/app_user.dart';
import 'package:answer24/models/chat/message/message.dart';
import 'package:answer24/widgets/chat/message_tile/message_tile.dart';
import 'package:answer24/widgets/custom/show_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalChatScreen extends StatelessWidget {
  const PersonalChatScreen({required this.chatID, Key? key}) : super(key: key);
  final String chatID;
  @override
  Widget build(BuildContext context) {
    Stream fetchChat(String cid) {
      Future.delayed(const Duration(seconds: 2));
      StreamController stream = StreamController();
      return stream.stream;
    }

    final AppUser user = AppUser();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text('${user.firstName} ${user.lastName}'),
              const Text(
                'Online',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.video_camera)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.phone)),
          ],
        ),
        body: StreamBuilder(
          stream: fetchChat(chatID),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something going wrong');
            }
            // else if (snapshot.hasData) {
            else {
              final List<Message> messages = listOfMessage;
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: messages[index],
                    isMe: index % 2 == 0,
                  );
                },
              );
            }
            // else {
            //   return const ShowLoading();
            // }
          },
        ));
  }
}
