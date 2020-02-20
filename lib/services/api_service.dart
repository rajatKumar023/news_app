import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class APIService {
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic> params = null}) async {
    try {
      var data = await http.get(_getUrlWithParams(url, params: params));
      return _getResponse(data);
    } catch (e) {
      throw e;
    }
  }

  // Helper Methods for API Services
  String _getUrl(String url) {
    return 'http://newsapi.org/v2' + url;
  }

  String _getUrlWithParams(String url, {Map<String, dynamic> params}) {
    var absUrl = _getUrl(url);

    if (params != null) {
      var paramsString = '';
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
      paramsString += '&apiKey=9c022cbfdbe142658707e3409345e367';
      return absUrl + '?' + paramsString.substring(1);
    }

    return absUrl;
  }

  Map<String, dynamic> _getResponse(http.Response response) {
    print("api service");
    print(response.statusCode.toString());
    print(response.body.toString());
    print(response.request.url.toString());

    if (response.statusCode == 204 || response.body.isEmpty) return null;

    final Map<String, dynamic> body = json.decode(response.body);
    if (body['status'] == 'ok') {
      return body;
    } else if (body['status'] == 'error') {
      throw body['message'];
    }
  }
}

enum RequestType { JSON, FORM }
