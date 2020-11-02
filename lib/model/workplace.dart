import 'package:ub/model/gps.dart';
import 'package:ub/model/zone.dart';

class Workplace {
  int id;
  String name;
  String address;
  Gps gps;
  List<Zone> zones;

  Workplace({this.id, this.name, this.address, this.gps, this.zones});

  Workplace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    gps = json['gps'] != null ? new Gps.fromJson(json['gps']) : null;
    if (json['zones'] != null) {
      zones = new List<Zone>();
      json['zones'].forEach((v) {
        zones.add(new Zone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    if (this.gps != null) {
      data['gps'] = this.gps.toJson();
    }
    if (this.zones != null) {
      data['zones'] = this.zones.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
