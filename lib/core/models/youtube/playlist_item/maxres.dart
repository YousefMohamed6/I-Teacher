class Maxres {
  String? url;
  int? width;
  int? height;

  Maxres({this.url, this.width, this.height});

  factory Maxres.fromJson(Map<String, dynamic> json) => Maxres(
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
