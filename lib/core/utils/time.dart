
import 'package:mrjoo/features/chat/data/model/message_model.dart';

class TimeHelper {
  TimeHelper({required this.message});

  final MessageModel message;

  String timeState = '';
  String hour() {
    var time = DateTime.parse(message.createdAt);
    String hour = '';
    if (time.hour == 24) {
      hour = '12';
      timeState = 'Am';
      return hour;
    } else if (time.hour > 12) {
      hour = (time.hour - 12).toString();
      timeState = 'Pm';
      return hour.toString();
    } else {
      timeState = 'Am';
      return hour.toString();
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
