import 'package:mrjoo/features/chat/data/model/message_model.dart';

class TimeHelper {
  TimeHelper({required this.message});

  final MessageModel message;

  String timeState = '';
  String hour() {
    var time = DateTime.parse(message.createdAt);
    if (time.hour == 24) {
      timeState = 'Am';
      return (time.hour - 12).toString();
    } else if (time.hour > 12) {
      timeState = 'Pm';
      return (time.hour - 12).toString();
    } else if (time.hour < 12) {
      timeState = 'Am';
      return time.hour.toString();
    } else {
      timeState = 'Pm';
      return time.hour.toString();
    }
  }

  String minute() {
    var time = DateTime.parse(message.createdAt);
    return time.minute.toString();
  }

  String state() {
    return timeState;
  }
}
