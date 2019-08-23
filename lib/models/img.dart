import 'dart:convert';

Img hitFromJson(String str) {
  final jsonData = json.decode(str);
  return Img.fromJson(jsonData);
}

class Img {
  int id;
  int previewHeight;
  int previewWidth;
  String previewUrl;

  Img({this.id, this.previewHeight, this.previewWidth, this.previewUrl});

  Img.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    previewHeight = json['previewHeight'];
    previewWidth = json['previewWidth'];
    previewUrl = json['previewURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['previewHeight'] = this.previewHeight;
    data['previewWidth'] = this.previewWidth;
    data['previewURL'] = this.previewUrl;
    return data;
  }
}
