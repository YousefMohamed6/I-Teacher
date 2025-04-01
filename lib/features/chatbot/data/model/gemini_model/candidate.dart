import 'content.dart';

class Candidate {
  Content? content;
  String? finishReason;
  double? avgLogprobs;

  Candidate({this.content, this.finishReason, this.avgLogprobs});

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        content: json['content'] == null
            ? null
            : Content.fromJson(json['content'] as Map<String, dynamic>),
        finishReason: json['finishReason'] as String?,
        avgLogprobs: (json['avgLogprobs'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'content': content?.toJson(),
        'finishReason': finishReason,
        'avgLogprobs': avgLogprobs,
      };
}
