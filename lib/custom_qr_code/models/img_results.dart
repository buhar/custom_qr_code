import 'package:custom_qr_code/custom_qr_code/models/img.dart';
import 'dart:convert';

ImgResults imgResultsFromJson(String str) {
  final jsonData = json.decode(str);
  return ImgResults.fromJson(jsonData);
}

class ImgResults {
  List<Img> hits;
  int totalHits;
  int total;

  ImgResults({
    this.hits,
    this.totalHits,
    this.total
  });

  ImgResults.fromJson(Map<String, dynamic> json) {
    if (json['hits'] != null) {
      hits = new List<Img>();
      json['hits'].forEach((v) {
        hits.add(Img.fromJson(v));
      });
    }
    totalHits = json['totalHits'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hits != null) {
      data['data'] = this.hits.map((v) => v.toJson()).toList();
    }
    data['totalHits'] = this.totalHits;
    data['total'] = this.total;
    return data;
  }
}