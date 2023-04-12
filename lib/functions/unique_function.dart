import 'date_functions.dart';

class UniqueFunction {
  static String get messageID => 'msg-${DateFunctions.timeMicro}';
  static String get chatID => 'chat-${DateFunctions.timeMicro}';
}
