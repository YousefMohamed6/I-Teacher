class Standard {
  String? url;
  int? width;
  int? height;

  Standard({this.url, this.width, this.height});

  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
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
