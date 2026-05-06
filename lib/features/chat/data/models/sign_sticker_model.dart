class SignStickerModel {
  final String id;
  final String url;
  final String labelEn;
  final String labelAr;
  final String category;

  SignStickerModel({
    required this.id,
    required this.url,
    required this.labelEn,
    required this.labelAr,
    required this.category,
  });

  factory SignStickerModel.fromJson(Map<String, dynamic> json) {
    return SignStickerModel(
      id: json['id'] as String,
      url: json['url'] as String,
      labelEn: json['labelEn'] as String,
      labelAr: json['labelAr'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'labelEn': labelEn,
      'labelAr': labelAr,
      'category': category,
    };
  }
}
