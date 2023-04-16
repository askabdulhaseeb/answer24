import 'package:answer24/utilities/app_image.dart';

import '../../../enums/chat/message_type_enum.dart';
import '../../../functions/unique_function.dart';
import 'message_attachment.dart';
import 'message_read_info.dart';

class Message {
  Message({
    required this.text,
    String? messageID,
    MessageTypeEnum? type,
    List<MessageAttachment>? attachment,
    String? sendBy,
    List<MessageReadInfo>? sendTo,
    DateTime? time,
    this.replyOf,
  })  : messageID = messageID ?? UniqueFunction.messageID,
        type = type ?? MessageTypeEnum.text,
        attachment = attachment ?? <MessageAttachment>[],
        sendBy = sendBy ?? 'sendBy',
        sendTo = sendTo ?? <MessageReadInfo>[],
        time = time ?? DateTime.now();

  final String messageID;
  final String? text;
  final MessageTypeEnum type;
  final List<MessageAttachment> attachment;
  final String sendBy;
  final List<MessageReadInfo> sendTo;
  final DateTime time;
  final Message? replyOf;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message_id': messageID,
      'text': text,
      'type': type.json,
      'attachment': attachment.map((MessageAttachment x) => x.toMap()).toList(),
      'send_by': sendBy,
      'send_to': sendTo.map((MessageReadInfo x) => x.toMap()).toList(),
      'time': time,
      'reply_of': replyOf?.toMap(),
    };
  }

  // ignore: sort_constructors_first
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageID: map['message_id'] ?? '',
      text: map['text'],
      type: MessageTypeEnumConvertor()
          .toEnum(map['type'] ?? MessageTypeEnum.text.json),
      attachment: List<MessageAttachment>.from(
          // ignore: always_specify_types
          map['attachment']?.map((x) => MessageAttachment.fromMap(x))),
      sendBy: map['send_by'] ?? '',
      sendTo: List<MessageReadInfo>.from(map['send_to']?.map(
        (dynamic x) => MessageReadInfo.fromMap(x),
      )),
      time: map['time'] ?? DateTime.now(),
      replyOf:
          map['reply_of'] != null ? Message.fromMap(map['reply_of']) : null,
    );
  }
}

List<Message> listOfMessage = [
  Message(text: 'This is the First Message'),
  Message(
    text: 'This is the message with 6 photos',
    type: MessageTypeEnum.image,
    attachment: [
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
    ],
  ),
  Message(text: 'Message'),
  Message(
    text: 'You miss the call from helper',
    type: MessageTypeEnum.announcement,
  ),
  Message(text: 'Message is here to tell you about nothing 😂'),
  Message(
    text: '',
    type: MessageTypeEnum.image,
    attachment: [
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
      MessageAttachment(url: AppImages.dummyURL, type: MessageTypeEnum.image),
    ],
  ),
];
