import 'package:answer24/functions/unique_funcation.dart';
import 'package:answer24/models/chat/message/message.dart';
import 'package:answer24/utilities/app_image.dart';

class Chat {
  Chat({
    required this.title,
    required this.imageURL,
    Message? lastMessage,
    List<Message>? unseenMessages,
    String? chatID,
  })  : lastMessage = lastMessage ??
            Message(
              text:
                  'Lorem ipsum is placeholder text commonly used in the graphic',
            ),
        unseenMessages = unseenMessages ?? [],
        chatID = chatID ?? UniqueFuncation.chatID;
  final String chatID;
  final String imageURL;
  final String title;
  final Message lastMessage;
  final List<Message> unseenMessages;
}

List<Chat> chasts = [
  Chat(title: 'Deirdre Jhon', imageURL: AppImages.dummyURL, unseenMessages: [
    Message(text: 'text'),
    Message(text: 'text'),
    Message(text: 'text'),
  ]),
  Chat(title: 'Alexandra Mike', imageURL: AppImages.dummyURL),
  Chat(title: 'Jennifer Smith', imageURL: AppImages.dummyURL),
  Chat(title: 'Katherine Wiz', imageURL: AppImages.dummyURL),
  Chat(
    title: 'Michelle Jhonson',
    imageURL: AppImages.dummyURL,
    lastMessage:
        Message(text: '📸 Send a photo', time: DateTime(2023, 9, 7, 17, 30)),
  ),
  Chat(
    title: 'Samantha Nialo',
    imageURL: AppImages.dummyURL,
    lastMessage:
        Message(text: '📹 Send a video', time: DateTime(2022, 9, 7, 17, 30)),
  ),
  Chat(
    title: 'Natalie Hadon',
    imageURL: AppImages.dummyURL,
    lastMessage: Message(
        text: 'This is just a randrom text from the user',
        time: DateTime(2022, 9, 7, 17, 30)),
  ),
  Chat(
    title: 'Katherine Wiz',
    imageURL: AppImages.dummyURL,
    lastMessage:
        Message(text: '📹 Send a video', time: DateTime(2021, 9, 7, 17, 30)),
  ),
  Chat(
    title: 'Michelle Jhonson',
    imageURL: AppImages.dummyURL,
    lastMessage:
        Message(text: '📹 Send a video', time: DateTime(2021, 9, 7, 17, 30)),
  ),
];
