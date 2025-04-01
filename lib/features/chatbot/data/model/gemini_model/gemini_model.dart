import 'candidate.dart';
import 'usage_metadata.dart';

class GeminiModel {
  List<Candidate>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;

  GeminiModel({this.candidates, this.usageMetadata, this.modelVersion});

  factory GeminiModel.fromJson(Map<String, dynamic> json) => GeminiModel(
        candidates: (json['candidates'] as List<dynamic>?)
            ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
            .toList(),
        usageMetadata: json['usageMetadata'] == null
            ? null
            : UsageMetadata.fromJson(
                json['usageMetadata'] as Map<String, dynamic>),
        modelVersion: json['modelVersion'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'candidates': candidates?.map((e) => e.toJson()).toList(),
        'usageMetadata': usageMetadata?.toJson(),
        'modelVersion': modelVersion,
      };
}
