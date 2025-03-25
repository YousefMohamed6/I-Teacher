class Default {
  String? url;
  int? width;
  int? height;

  Default({this.url, this.width, this.height});

  factory Default.fromJson(Map<String, dynamic> json) => Default(
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
