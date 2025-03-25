class Medium {
  String? url;
  int? width;
  int? height;

  Medium({this.url, this.width, this.height});

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        url: json['url'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
