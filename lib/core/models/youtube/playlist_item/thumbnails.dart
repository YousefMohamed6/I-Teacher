import 'default.dart';
import 'high.dart';
import 'maxres.dart';
import 'medium.dart';
import 'standard.dart';

class Thumbnails {
  Default? thumbnailsDefault;
  Medium medium;
  High? high;
  Standard? standard;
  Maxres? maxres;

  Thumbnails({
    this.thumbnailsDefault,
    required this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: json['default'] == null
            ? null
            : Default.fromJson(json['default'] as Map<String, dynamic>),
        medium: Medium.fromJson(json['medium'] as Map<String, dynamic>),
        high: json['high'] == null
            ? null
            : High.fromJson(json['high'] as Map<String, dynamic>),
        standard: json['standard'] == null
            ? null
            : Standard.fromJson(json['standard'] as Map<String, dynamic>),
        maxres: json['maxres'] == null
            ? null
            : Maxres.fromJson(json['maxres'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'default': thumbnailsDefault?.toJson(),
        'medium': medium.toJson(),
        'high': high?.toJson(),
        'standard': standard?.toJson(),
        'maxres': maxres?.toJson(),
      };
}
