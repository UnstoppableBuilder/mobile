import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ub/model/gps.dart';
import 'package:ub/model/user.dart';

class DataProvider {
  final url = 'https://a91c9711-9f96-4231-8fd8-4d80070b0521.mock.pstmn.io';

  Future<Map<String, dynamic>> logInWithPhoneAndCode(
      {String phone, String code}) async {
    final fullUrl = '$url/api/token';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode(
          {'phone': phone, 'code': code},
        ),
        options: Options(headers: {
          'x-mock-response-name': 'signup',
          'Content-Type': 'application/json'
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Authorization error");
    }
  }

  Future<int> signUp({
    String phone,
    String code,
    String firstName,
    String lastName,
  }) async {
    final fullUrl = '$url/api/signup';
    Response response = await Dio().post(fullUrl,
        options: Options(headers: {
          'x-mock-response-name': 'signup',
          'Content-Type': 'application/json'
        }),
        data: jsonEncode({
          'phone': phone,
          'code': code,
          'first_name': firstName,
          'last_name': lastName,
        }));
    return response.statusCode;
  }

  Future<int> postShift(
      {int id,
      int date,
      int staredAt,
      dynamic endedAt,
      int workplaceId,
      int zoneId}) async {
    final fullUrl = '$url/api/shift';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode({
          'id': id,
          'date': date,
          'started_at': staredAt,
          'ended_at': endedAt,
          'workplace_id': workplaceId,
          'zone_id': zoneId
        }));
    return response.statusCode;
  }

  Future<Map<String, dynamic>> getShift(String accessToken) async {
    String fullUrl = '$url/api/shift';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to download campaign data");
    }
  }

  Future<int> sos({
    Map<String, dynamic> type,
    String description,
    int createdAt,
  }) async {
    final fullUrl = '$url/api/sos';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode({
          'type': type,
          'description': description,
          'created_at': createdAt
        }));
    return response.statusCode;
  }

  Future<int> notification({
    Map<String, dynamic> type,
    String info,
    int createdAt,
  }) async {
    final fullUrl = '$url/api/notify';
    Response response = await Dio().post(fullUrl,
        data:
            jsonEncode({'type': type, 'info': info, 'created_at': createdAt}));
    return response.statusCode;
  }

  Future<int> tracking({
    List<Gps> gpsList,
  }) async {
    final fullUrl = '$url/api/track';
    Response response = await Dio().post(fullUrl, data: jsonEncode({gpsList}));
    return response.statusCode;
  }

  Future<Map<String, dynamic>> getWorkplaces(String accessToken) async {
    String fullUrl = '$url/api/workplace/list';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to download campaign data");
    }
  }

  Future<Map<String, dynamic>> getSpecialization(String accessToken) async {
    String fullUrl = '$url/api/specialization/list';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to download campaign data");
    }
  }
}
