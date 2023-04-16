import 'package:answer24/models/chat/message/message.dart';
import 'package:flutter/material.dart';

import '../../../enums/chat/message_type_enum.dart';
import '../../../functions/date_functions.dart';
import 'announcement_message_tile.dart';
import 'attachment_message_tile.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({required this.message, this.isMe = false, super.key});
  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    const double _borderRadius = 12;
    return message.type == MessageTypeEnum.announcement
        ? AnnouncementMessageTile(text: message.text)
        : Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadius),
                child: Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_borderRadius),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(1, 1),
                      ),
                    ],
                    color: isMe
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (message.attachment.isNotEmpty)
                              AttachmentMessageTile(
                                isMe: isMe,
                                borderRadius: _borderRadius,
                                attachments: message.attachment,
                              ),
                            if (message.text != null &&
                                message.text!.isNotEmpty)
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.70,
                                  minWidth: 100,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: SelectableText(
                                    message.text ?? 'no message',
                                    textAlign: TextAlign.left,
                                    style: isMe
                                        ? const TextStyle(color: Colors.black)
                                        : null,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Text(
                          DateFunctions.timeInDigits(message.time),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
