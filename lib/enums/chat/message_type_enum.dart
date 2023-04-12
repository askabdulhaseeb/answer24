enum MessageTypeEnum {
  text('Text', 'text'),
  image('Image', 'image'),
  audio('Audio', 'audio'),
  video('Video', 'video'),
  document('Document', 'document'),
  announcement('Announcement', 'announcement');

  const MessageTypeEnum(this.title, this.json);
  final String title;
  final String json;
}

class MessageTypeEnumConvertor {
  MessageTypeEnum toEnum(String type) {
    if (type == 'text') {
      return MessageTypeEnum.text;
    } else if (type == 'image') {
      return MessageTypeEnum.image;
    } else if (type == 'audio') {
      return MessageTypeEnum.audio;
    } else if (type == 'video') {
      return MessageTypeEnum.video;
    } else if (type == 'document') {
      return MessageTypeEnum.document;
    } else if (type == 'announcement') {
      return MessageTypeEnum.announcement;
    } else {
      return MessageTypeEnum.text;
    }
  }
}
