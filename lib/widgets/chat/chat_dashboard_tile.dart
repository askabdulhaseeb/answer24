import 'package:answer24/functions/date_functions.dart';
import 'package:flutter/material.dart';

import '../../models/chat/chat.dart';

class ChatDashboardTile extends StatelessWidget {
  const ChatDashboardTile({required this.chat, super.key});
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(chat.imageURL)),
      title: Text(chat.title),
      subtitle: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              chat.lastMessage.text ?? 'null',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.done_all, color: Theme.of(context).primaryColor, size: 12),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(DateFunctions.timeForChat(chat.lastMessage.time)),
          chat.unseenMessages.isEmpty
              ? const SizedBox(height: 10)
              : CircleAvatar(
                  radius: 10,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(chat.unseenMessages.length.toString()),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
