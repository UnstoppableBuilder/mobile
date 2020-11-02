import 'package:ub/model/user.dart';

class Auth {
  int accountId;
  User account;
  String refreshToken;
  String accessToken;
  int expiresAt;

  Auth(
      {this.accountId,
      this.account,
      this.refreshToken,
      this.accessToken,
      this.expiresAt});

  Auth.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    account =
        json['account'] != null ? new User.fromJson(json['account']) : null;
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['refresh_token'] = this.refreshToken;
    data['access_token'] = this.accessToken;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
