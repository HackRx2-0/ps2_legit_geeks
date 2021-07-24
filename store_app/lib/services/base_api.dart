import 'dart:io';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'api-response.dart';
import 'http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BaseApi {
  final String _baseUrl = "e2ec63227a22.ngrok.io";

  //'doorstepdelhi.herokuapp.com';
  //'36eb00ef8692.ngrok.io'
  final _prefs = getIt.get<Prefs>();
  Future<ApiResponse> signUp(Map data, String endpoint) async {
    var responseBody = json.decode('{"data": "", "status": "NOK"}');

    try {
      final uri = Uri.https(_baseUrl, endpoint);
      print(uri);
      final response = await http.post(uri, body: data);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 207) {
        print(response.body);
        print('==');
        return ApiResponse(data: jsonDecode(response.body));
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        String error = 'Error occurred';
        data.keys.forEach((String key) {
          if (key.contains('error')) {
            error = data[key][0];
            print(error);
          }
        });
        return ApiResponse(error: true, errorMessage: error);
      }
    } on SocketException catch (error) {
      throw HttpException(message: 'No Internet Connection');
    } catch (e) {
      throw e;
    }
  }

  Future<void> googleLogIn(Map data, String endpoint) async {
    var responseBody = json.decode('{"data": "", "status": "NOK"}');

    try {
      final uri = Uri.https(_baseUrl, endpoint);
      print(uri);
      final response = await http.post(uri, body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        responseBody = jsonDecode(response.body);
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        String error = 'Error occurred';
        data.keys.forEach((String key) {
          if (key.contains('error')) {
            error = data[key][0];
            print(error);
          }
        });
        throw HttpException(message: error);
      }
    } on SocketException catch (error) {
      throw HttpException(message: 'No Internet Connection');
    } catch (e) {
      throw e;
    }
  }

  //GET
  Future<ApiResponse> getRequest(
      {String endpoint, Map<String, String> query}) async {
    final uri = Uri.https(_baseUrl, endpoint, query);
    print(uri);
    print(_prefs.getToken());
    return processResponse(await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}',
      },
    ));
  }

  //GET Without Auth
  Future<ApiResponse> getWithoutAuthRequest(
      {String endpoint, Map<String, String> query}) async {
    final uri = Uri.https(_baseUrl, endpoint, query);
    print("authtoken is: ");
    print({_prefs.getToken()});
    print(uri);
    return processResponse(await http.get(
      uri,
    ));
  }

  //POST
  Future<ApiResponse> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final uri = Uri.https(_baseUrl, endpoint);
    return processResponse(await http.post(uri,
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}',
        },
        body: data));
  }

  // PUT
  Future<ApiResponse> patchRequest(
      String endpoint, Map<String, dynamic> data) async {
    final uri = Uri.https(_baseUrl, endpoint);
    print(uri);
    return processResponse(await http.patch(uri,
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}',
        },
        body: data));
  }

  // DELETE
  Future<ApiResponse> deleteRequest({String endpoint, String id}) async {
    final String endPointUrl = id == null ? endpoint : '$endpoint/' + '$id/';
    print(endPointUrl);
    final uri = Uri.https(_baseUrl, endPointUrl);
    print(uri);
    return processResponse(await http.delete(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}',
      },
    ));
  }

  Future<ApiResponse> processResponse(Response response) async {
    // if (_authToken == null && _authToken.isEmpty) {
    //   print('not logged in');
    //   return ApiResponse(error: true, errorMessage: 'User not logged in');
    // }
    try {
      if (response.statusCode >= 200 && response.statusCode <= 207) {
        print('==');
        return ApiResponse(data: jsonDecode(response.body));
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        String error = 'Error occurred';
        data.keys.forEach((String key) {
          // if (key.contains('error')) {
          error = data[key][0];
          print(error);
          // }
        });
        return ApiResponse(error: true, errorMessage: error);
      }
    } on SocketException catch (error) {
      print('socket');
      throw HttpException(message: 'No Internet Connection');
    } on PlatformException catch (error) {
      print('plt');
      throw HttpException(message: error.toString());
    } catch (e) {
      throw e;
    }
  }
}
