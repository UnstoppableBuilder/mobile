import 'package:ub/model/type.dart';

class ServerNotification {
  MessageType type;
  String info;
  int createdAt;

  ServerNotification({this.type, this.info, this.createdAt});

  ServerNotification.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new MessageType.fromJson(json['type']) : null;
    info = json['info'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['info'] = this.info;
    data['created_at'] = this.createdAt;
    return data;
  }
}
