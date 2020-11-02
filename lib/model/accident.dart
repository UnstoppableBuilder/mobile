import 'package:ub/model/type.dart';

class Accident {
  MessageType type;
  String description;
  int createdAt;

  Accident({this.type, this.description, this.createdAt});

  Accident.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new MessageType.fromJson(json['type']) : null;
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    return data;
  }
}
