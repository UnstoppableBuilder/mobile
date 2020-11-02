import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ub/model/gps.dart';

class DataProvider {
  final url = 'https://ub.pkozlov.ru';

  Future<Map<String, dynamic>> registerOrLogin({
    String phone,
    String code,
    String firstName,
    String lastName,
    String specializationId = '1',
  }) async {
    final fullUrl = '$url/api/auth/';
    Response response = await Dio().post(fullUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode({
          "phone": phone,
          "code": code,
          "first_name": firstName,
          "last_name": lastName,
          "specialization_id": specializationId
        }));
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception("Authorization error");
    }
  }

  Future<int> startSession({
    String accessToken,
    int workplaceId,
    String startedAt,
    String endedAt,
    int zoneid,
  }) async {
    final fullUrl = '$url/api/session/';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode({
          "workplace_id": workplaceId,
          "zone_id": zoneid,
          "started_at": startedAt,
          "ended_at": endedAt
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Token $accessToken'
        }));
    print(response.statusCode);
    return response.statusCode;
  }

  Future<int> endSession({
    String accessToken,
    int workplaceId,
    String startedAt,
    String endedAt,
    int zoneid,
  }) async {
    final fullUrl = '$url/api/session/';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode({
          "workplace_id": workplaceId,
          "zone_id": zoneid,
          "started_at": startedAt,
          "ended_at": endedAt
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Token $accessToken'
        }));
    print(response.statusCode);
    return response.statusCode;
  }

  Future<int> sos({
    String accessToken,
    int sessionId,
    String description,
    int createdAt,
  }) async {
    final fullUrl = '$url/api/worker/sos/';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode({
          'session_id': sessionId,
          'description': description,
          'created_at': createdAt
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Token $accessToken'
        }));
    print(response.statusCode);
    return response.statusCode;
  }

  Future<int> track({
    String accessToken,
    List<Gps> gpsList,
    int sessionId,
    String createdAt,
  }) async {
    final fullUrl = '$url/api/worker/sos/';
    Response response = await Dio().post(fullUrl,
        data: jsonEncode(
            {"session_id": sessionId, "gps": gpsList, "created_at": createdAt}),
        options: Options(headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Token $accessToken'
        }));
    print(response.statusCode);
    return response.statusCode;
  }

  Future<Map<String, dynamic>> getSpecializationList(String accessToken) async {
    String fullUrl = '$url/api/specializations/';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Token $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to get Specialization List data");
    }
  }

  Future<Map<String, dynamic>> getWorkplaceList(String accessToken) async {
    String fullUrl = '$url//api/workplace/';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Token $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to get Workplace list data");
    }
  }

  Future<Map<String, dynamic>> getWorkerInfo(String accessToken) async {
    String fullUrl = '$url/api/worker/';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Token $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to get Worker info data");
    }
  }

  Future<Map<String, dynamic>> getSessionInfo(String accessToken) async {
    String fullUrl = '$url/api/session/';

    Response response = await Dio().get(fullUrl,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Token $accessToken'}));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to get Session info  data");
    }
  }
}
