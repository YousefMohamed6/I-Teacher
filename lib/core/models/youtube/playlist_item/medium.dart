class Medium {
  String url;
  num width;
  num height;

  Medium({required this.url, required this.width, required this.height});

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        url: json['url'] as String,
        width: json['width'] as num,
        height: json['height'] as num,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
