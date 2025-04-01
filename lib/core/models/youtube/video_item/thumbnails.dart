import 'default.dart';
import 'high.dart';
import 'medium.dart';

class Thumbnails {
  Default? thumbnailsDefault;
  Medium? medium;
  High? high;

  Thumbnails({this.thumbnailsDefault, this.medium, this.high});

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: json['default'] == null
            ? null
            : Default.fromJson(json['default'] as Map<String, dynamic>),
        medium: json['medium'] == null
            ? null
            : Medium.fromJson(json['medium'] as Map<String, dynamic>),
        high: json['high'] == null
            ? null
            : High.fromJson(json['high'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'default': thumbnailsDefault?.toJson(),
        'medium': medium?.toJson(),
        'high': high?.toJson(),
      };
}
