class Localized {
  String? title;
  String? description;

  Localized({this.title, this.description});

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
