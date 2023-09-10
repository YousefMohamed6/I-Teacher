class TimeHelper {
  TimeHelper({required this.index, required this.messagesList});

  final List messagesList;
  final int index;
  String timeState = 'Pm';
  String hour() {
    var hour = messagesList[index].time.toDate().hour;
    if (hour == 24) {
      hour = '12';
      timeState = 'Am';
      return hour!;
    } else if (hour > 12) {
      hour = hour - 12;
      timeState = 'Pm';
      return hour.toString();
    } else {
      timeState = 'Am';
      return hour.toString();
    }
  }

  String minute() {
    return messagesList[index].time.toDate().minute.toString();
  }

  String state() {
    return timeState;
  }
}
