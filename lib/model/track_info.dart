import 'package:ub/model/gps.dart';

class TrackInfo {
  Gps gps;
  int noiseLevel;
  int lightLevel;
  Acceleration acceleration;
  int createdAt;

  TrackInfo(
      {this.gps,
      this.noiseLevel,
      this.lightLevel,
      this.acceleration,
      this.createdAt});

  TrackInfo.fromJson(Map<String, dynamic> json) {
    gps = json['gps'] != null ? new Gps.fromJson(json['gps']) : null;
    noiseLevel = json['noise_level'];
    lightLevel = json['light_level'];
    acceleration = json['acceleration'] != null
        ? new Acceleration.fromJson(json['acceleration'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gps != null) {
      data['gps'] = this.gps.toJson();
    }
    data['noise_level'] = this.noiseLevel;
    data['light_level'] = this.lightLevel;
    if (this.acceleration != null) {
      data['acceleration'] = this.acceleration.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Acceleration {
  int x;
  int y;
  int z;
  int value;

  Acceleration({this.x, this.y, this.z, this.value});

  Acceleration.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    z = json['z'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['z'] = this.z;
    data['value'] = this.value;
    return data;
  }
}
