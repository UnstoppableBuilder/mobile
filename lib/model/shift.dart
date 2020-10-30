class Shift {
  int id;
  int date;
  int startedAt;
  int endedAt;
  int workplaceId;
  int zoneId;

  Shift(
      {this.id,
      this.date,
      this.startedAt,
      this.endedAt,
      this.workplaceId,
      this.zoneId});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    startedAt = json['started_at'];
    endedAt = json['ended_at'];
    workplaceId = json['workplace_id'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['started_at'] = this.startedAt;
    data['ended_at'] = this.endedAt;
    data['workplace_id'] = this.workplaceId;
    data['zone_id'] = this.zoneId;
    return data;
  }
}
