class User {
  int iD;
  String phone;
  String code;
  String firstName;
  String lastName;
  int specializationId;

  User(
      {this.iD,
      this.phone,
      this.code,
      this.firstName,
      this.lastName,
      this.specializationId});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    phone = json['phone'];
    code = json['code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    specializationId = json['specialization_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['specialization_id'] = this.specializationId;
    return data;
  }
}
