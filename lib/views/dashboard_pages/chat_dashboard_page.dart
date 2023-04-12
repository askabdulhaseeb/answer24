import 'package:answer24/widgets/chat/chat_dashboard_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/chat/chat.dart';

class ChatDashboardPage extends StatelessWidget {
  const ChatDashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Chat> chats = dummyChatLists;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text('Chats'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.perm_contact_calendar_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.search,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Search for messages or users',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: chats.length,
              separatorBuilder: (context, _) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  ChatDashboardTile(chat: chats[index]),
            )
          ],
        ),
      ),
    );
  }
}
