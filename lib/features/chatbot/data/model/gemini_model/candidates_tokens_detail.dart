class CandidatesTokensDetail {
  String? modality;
  int? tokenCount;

  CandidatesTokensDetail({this.modality, this.tokenCount});

  factory CandidatesTokensDetail.fromJson(Map<String, dynamic> json) {
    return CandidatesTokensDetail(
      modality: json['modality'] as String?,
      tokenCount: json['tokenCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'modality': modality,
        'tokenCount': tokenCount,
      };
}
