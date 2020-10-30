class Zone {
  int id;
  String name;
  String description;
  String iconUrl;

  Zone({this.id, this.name, this.description, this.iconUrl});

  Zone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['icon_url'] = this.iconUrl;
    return data;
  }
}
