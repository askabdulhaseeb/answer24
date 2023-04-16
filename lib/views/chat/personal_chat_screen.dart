import 'dart:async';

import 'package:answer24/models/app_user.dart';
import 'package:answer24/models/chat/message/message.dart';
import 'package:answer24/widgets/chat/message_tile/message_tile.dart';
import 'package:answer24/widgets/custom/show_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../functions/date_functions.dart';

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
              return GroupedListView<Message, String>(
                shrinkWrap: true,
                primary: false,
                reverse: true,
                useStickyGroupSeparators: true,
                elements: messages,
                groupBy: (Message element) =>
                    DateFunctions.chatMessageDate(element.time),
                groupHeaderBuilder: (Message element) {
                  return Container(
                    color: Theme.of(context).cardColor,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          constraints: const BoxConstraints(minWidth: 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffA1D6ED),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            DateFunctions.chatMessageDate(element.time),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemBuilder: (BuildContext context, Message msg) {
                  return MessageTile(message: msg);
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
